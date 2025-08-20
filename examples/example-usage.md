# Slide Agent - Example Usage Guide

## Basic Examples

### 1. Simple Presentation Creation

```bash
# Start Claude Code
claude code

# Create a basic presentation
/slide-create "Introduction to Machine Learning"
```

**What happens:**
1. AI analyzes the topic
2. Researches key concepts
3. Creates 10-15 slides with:
   - Title slide
   - Overview/Agenda
   - Core concept slides
   - Examples
   - Summary
   - Q&A slide

### 2. Detailed Business Report

```bash
# Create with specific requirements
/slide-create "Q4 2024 Sales Performance Report for Executive Team, 20 minute presentation, focus on growth metrics and regional performance"
```

**Output includes:**
- Executive summary with KPIs
- Revenue charts and graphs
- Regional breakdown with maps
- Year-over-year comparisons
- Strategic recommendations
- Next steps

### 3. Academic Presentation with Research

```bash
# First, research the topic
/slide-research "Impact of artificial intelligence on healthcare diagnostics"

# Then create presentation using research
/slide-create --use-research --style academic --citations true
```

**Features:**
- Comprehensive literature review
- Proper academic citations
- Methodology slides
- Data visualizations
- Discussion points
- References slide

## Advanced Workflows

### Workflow 1: Corporate Training Module

```bash
# Step 1: Define the training outline
/slide-create "Cybersecurity Awareness Training" --interactive

# Step 2: Add interactive elements
/slide-add quiz "Phishing Email Recognition" --after 5
/slide-add exercise "Password Strength Checker" --after 8

# Step 3: Add multimedia
/slide-add video "https://example.com/security-video.mp4" --slide 3

# Step 4: Generate handouts
/slide-export handouts --format pdf
```

### Workflow 2: Investor Pitch Deck

```bash
# Create pitch with specific structure
/slide-create "Series A Investor Pitch for TechStartup Inc"

# Add financial data
/slide-add chart --data "revenue-projections.csv" --type line --slide 8

# Add team slide with photos
/slide-add team --photos ./team-photos/ --slide 10

# Optimize for impact
/slide-optimize --focus "visual-impact,storytelling"

# Export versions
/slide-export investor-deck.pptx
/slide-export investor-deck-readonly.pdf
```

### Workflow 3: Conference Presentation

```bash
# Create with time constraints
/slide-create "Future of Renewable Energy" --duration 30 --audience "industry-experts"

# Add speaker notes
/slide-notes add --comprehensive

# Create backup versions
/slide-export backup --format "pptx,pdf,images"

# Generate presenter view
/slide-export presenter-view --with-notes
```

## Custom Agent Commands

### Research Agent

```bash
# Deep research mode
/slide-research "Quantum Computing Applications" --depth deep --sources "academic,industry"

# Get research summary
/slide-research summary

# Export research findings
/slide-research export --format markdown
```

### Design Optimizer Agent

```bash
# Full design optimization
/slide-optimize --all

# Specific optimizations
/slide-optimize --colors --consistency
/slide-optimize --animations --transitions
/slide-optimize --accessibility

# Apply specific theme
/slide-theme apply "corporate-blue"
```

### Content Enhancement

```bash
# Add supporting content
/slide-enhance --add-statistics
/slide-enhance --add-quotes
/slide-enhance --add-examples

# Simplify complex slides
/slide-simplify --slide 5-8

# Add visual elements
/slide-visuals suggest --slide all
/slide-visuals apply --approved
```

## Batch Operations

### Multiple Presentations from Data

```bash
# Create presentations from CSV
/slide-batch create --input "presentation-topics.csv" --template "business"

# Example CSV format:
# title,audience,duration,focus_points
# "Q1 Review","executives","15","revenue,growth"
# "Product Update","team","20","features,timeline"
```

### Bulk Updates

```bash
# Update all presentations in folder
/slide-batch update ./presentations/ --logo "new-logo.png"

# Apply new theme to multiple files
/slide-batch theme ./decks/ --theme "modern-dark"
```

## Integration Examples

### With Version Control

```bash
# Initialize git tracking
git init
git add presentations/

# Create presentation with auto-commit
/slide-create "Product Roadmap 2025" --git-commit

# Track changes
git diff presentations/product-roadmap-2025.pptx
```

### With CI/CD Pipeline

```yaml
# .github/workflows/presentation-build.yml
name: Build Presentations
on:
  push:
    paths:
      - 'content/*.md'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Slide Agent
        run: |
          curl -fsSL https://raw.githubusercontent.com/schlessera/ppt-slide-agent/main/install.sh | bash
      - name: Generate Presentations
        run: |
          claude code --run "/slide-batch create ./content/"
      - name: Upload Artifacts
        uses: actions/upload-artifact@v2
        with:
          name: presentations
          path: ./presentations/
```

## Error Recovery

### Handling Common Issues

```bash
# If PowerPoint server fails
/slide-fallback markdown  # Generate markdown version

# If research times out
/slide-research --timeout 60 --retry 3

# If design optimization fails
/slide-optimize --safe-mode

# Recovery from crash
/slide-recover --last-session
```

## Tips and Tricks

### 1. Quick Edits

```bash
# Edit specific slide
/slide-edit 5 "Change title to 'Market Analysis 2025'"

# Bulk text replacement
/slide-replace "Q3" "Q4" --all-slides
```

### 2. Template Management

```bash
# Save current as template
/slide-template save "my-company-template"

# List available templates
/slide-template list

# Apply template to existing
/slide-template apply "my-company-template" --to "presentation.pptx"
```

### 3. Performance Optimization

```bash
# Compress images
/slide-optimize images --quality 85

# Remove unused elements
/slide-clean --remove-unused

# Reduce file size
/slide-optimize size --target 10mb
```

## Keyboard Shortcuts (in Claude Code)

| Shortcut | Action |
|----------|--------|
| `Ctrl+N` | New presentation |
| `Ctrl+S` | Save current |
| `Ctrl+E` | Export |
| `Ctrl+O` | Optimize |
| `Ctrl+R` | Research mode |
| `Ctrl+T` | Apply theme |

## Common Use Cases

### Weekly Team Update

```bash
/slide-create "Weekly Team Update - {date}" --template weekly-update --auto-populate metrics
```

### Client Proposal

```bash
/slide-create "Proposal for {client_name}" --template proposal --tone professional --length detailed
```

### Educational Lecture

```bash
/slide-create "{topic}" --style educational --add-quizzes --duration 45 --handouts
```

### Marketing Campaign

```bash
/slide-create "Campaign: {campaign_name}" --visual-heavy --animations --social-media-export
```

## Support and Documentation

For more examples and detailed documentation:
- Run: `/slide-help [command]`
- Visit: [GitHub Wiki](https://github.com/schlessera/ppt-slide-agent/wiki)
- Join: [Discord Community](https://discord.gg/ppt-slide-agent)