#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HOOKS_DIR="$PROJECT_ROOT/hooks"

echo "🪝 Setting up Slide Agent hooks..."

# Create hooks directory
mkdir -p "$HOOKS_DIR"

# Before slide creation hook
cat > "$HOOKS_DIR/before-slide-create.sh" << 'EOF'
#!/bin/bash
# Hook: Before Slide Creation
# Purpose: Validate and prepare for slide creation

TOPIC="$1"
OUTPUT_DIR="$2"

echo "🎬 Preparing to create presentation: $TOPIC"

# Check if output directory exists
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
    echo "✅ Created output directory: $OUTPUT_DIR"
fi

# Check for existing presentation with same name
SAFE_TOPIC=$(echo "$TOPIC" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
OUTPUT_FILE="$OUTPUT_DIR/${SAFE_TOPIC}.pptx"

if [ -f "$OUTPUT_FILE" ]; then
    # Create backup
    BACKUP_FILE="${OUTPUT_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$OUTPUT_FILE" "$BACKUP_FILE"
    echo "📦 Backed up existing file to: $BACKUP_FILE"
fi

# Log the creation request
echo "$(date): Creating presentation '$TOPIC'" >> "$OUTPUT_DIR/.creation_log"

# Return success
exit 0
EOF

# After slide creation hook
cat > "$HOOKS_DIR/after-slide-create.sh" << 'EOF'
#!/bin/bash
# Hook: After Slide Creation
# Purpose: Post-process and validate created presentation

PRESENTATION_FILE="$1"
TOPIC="$2"

echo "✨ Post-processing presentation: $PRESENTATION_FILE"

if [ ! -f "$PRESENTATION_FILE" ]; then
    echo "❌ Error: Presentation file not found!"
    exit 1
fi

# Get file size
FILE_SIZE=$(du -h "$PRESENTATION_FILE" | cut -f1)
echo "📊 File size: $FILE_SIZE"

# Create a summary file
SUMMARY_FILE="${PRESENTATION_FILE%.pptx}_summary.txt"
cat > "$SUMMARY_FILE" << SUMMARY
Presentation: $TOPIC
Created: $(date)
File: $(basename "$PRESENTATION_FILE")
Size: $FILE_SIZE
Location: $(dirname "$PRESENTATION_FILE")
SUMMARY

echo "📝 Summary saved to: $SUMMARY_FILE"

# Optional: Auto-open presentation (commented out by default)
# if command -v xdg-open &> /dev/null; then
#     xdg-open "$PRESENTATION_FILE" &
# fi

# Optional: Send notification
if command -v notify-send &> /dev/null; then
    notify-send "Slide Agent" "Presentation '$TOPIC' created successfully!"
fi

exit 0
EOF

# Error handling hook
cat > "$HOOKS_DIR/on-slide-error.sh" << 'EOF'
#!/bin/bash
# Hook: On Slide Error
# Purpose: Handle errors during slide creation

ERROR_MSG="$1"
TOPIC="$2"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "❌ Error occurred during slide creation"
echo "Topic: $TOPIC"
echo "Error: $ERROR_MSG"

# Log error
ERROR_LOG="$PROJECT_ROOT/logs/errors.log"
mkdir -p "$(dirname "$ERROR_LOG")"
echo "[$TIMESTAMP] Topic: $TOPIC | Error: $ERROR_MSG" >> "$ERROR_LOG"

# Attempt recovery
echo "🔄 Attempting recovery..."

# Check if partial file exists and move to recovery folder
RECOVERY_DIR="$PROJECT_ROOT/presentations/recovery"
mkdir -p "$RECOVERY_DIR"

SAFE_TOPIC=$(echo "$TOPIC" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
PARTIAL_FILE="$PROJECT_ROOT/presentations/${SAFE_TOPIC}.pptx"

if [ -f "$PARTIAL_FILE" ]; then
    RECOVERY_FILE="$RECOVERY_DIR/${SAFE_TOPIC}_$(date +%Y%m%d_%H%M%S).pptx"
    mv "$PARTIAL_FILE" "$RECOVERY_FILE"
    echo "📦 Partial file moved to: $RECOVERY_FILE"
fi

# Optional: Send error notification
if command -v notify-send &> /dev/null; then
    notify-send -u critical "Slide Agent Error" "Failed to create '$TOPIC'"
fi

exit 0
EOF

# Research complete hook
cat > "$HOOKS_DIR/on-research-complete.sh" << 'EOF'
#!/bin/bash
# Hook: On Research Complete
# Purpose: Process research results before slide creation

RESEARCH_FILE="$1"
TOPIC="$2"

echo "🔍 Research completed for: $TOPIC"

if [ -f "$RESEARCH_FILE" ]; then
    # Count sources
    SOURCE_COUNT=$(grep -c "Source:" "$RESEARCH_FILE" 2>/dev/null || echo "0")
    echo "📚 Found $SOURCE_COUNT sources"
    
    # Create research summary
    SUMMARY_FILE="${RESEARCH_FILE%.json}_summary.md"
    echo "# Research Summary: $TOPIC" > "$SUMMARY_FILE"
    echo "Generated: $(date)" >> "$SUMMARY_FILE"
    echo "Sources: $SOURCE_COUNT" >> "$SUMMARY_FILE"
    echo "" >> "$SUMMARY_FILE"
    
    echo "📋 Research summary saved"
fi

exit 0
EOF

# Make all hooks executable
chmod +x "$HOOKS_DIR"/*.sh

echo "✅ Hooks setup complete"
echo "📁 Hooks location: $HOOKS_DIR"