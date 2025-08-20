---
description: Export presentation in various formats with documentation
allowed-tools: mcp__pptx__*, Bash, Read, Write
argument-hint: presentation name and optional format (pptx, pdf, png, markdown)
---

Export presentation "$ARGUMENTS" in multiple formats with comprehensive documentation.

## Export Options

1. **PowerPoint File (.pptx)**
   - Native editable format
   - Preserves all formatting
   - Includes speaker notes
   - Maintains animations/transitions

2. **PDF Document (.pdf)**
   - Universal viewing format
   - Print-ready output
   - Includes speaker notes as appendix
   - Bookmarked sections

3. **PNG Images**
   - Individual slide images
   - High resolution (1920x1080)
   - Useful for web/social media
   - Sequential numbering

4. **Markdown Documentation**
   - Structured overview
   - Embedded PNG images
   - Speaker notes included
   - Metadata and summaries

## Export Process

1. **Preparation**
   - Load target presentation
   - Verify presentation integrity
   - Check for missing elements
   - Prepare export directories

2. **PPTX Export**
   - Download using `mcp__pptx__download_presentation`
   - Save to presentations/exports/
   - Include timestamp in filename
   - Preserve all original elements

3. **Image Generation**
   - Use LibreOffice for rendering:
     ```bash
     libreoffice --headless --convert-to png *.pptx
     ```
   - Generate high-quality PNGs
   - Create thumbnail versions
   - Organize by slide number

4. **Markdown Documentation**
   - Create structured overview
   - Include presentation metadata
   - Embed slide images
   - Format speaker notes
   - Add table of contents

5. **PDF Creation** (if requested)
   - Convert via LibreOffice:
     ```bash
     libreoffice --headless --convert-to pdf *.pptx
     ```
   - Maintain formatting
   - Include hyperlinks
   - Embed fonts

## Markdown Format Structure

```markdown
# [Presentation Title]

## Metadata
- Created: [Date]
- Slides: [Count]
- Duration: [Estimated time]
- Author: [Claude Code Slide Agent]

## Table of Contents
[Auto-generated links to sections]

## Executive Summary
[Brief overview of presentation content]

## Slides

### Slide 1: [Title]
![Slide 1](exports/slide-001.png)

**Content:**
[Slide text content]

**Speaker Notes:**
[Notes for this slide]

---

[Repeated for each slide]

## Appendix
- Resources and references
- Additional notes
- Contact information
```

## File Organization

```
presentations/
├── exports/
│   ├── [name]_[timestamp]/
│   │   ├── [name].pptx
│   │   ├── [name].pdf
│   │   ├── [name]_overview.md
│   │   └── images/
│   │       ├── slide-001.png
│   │       ├── slide-002.png
│   │       └── ...
```

## Quality Standards

- **Images**: Minimum 1920x1080 resolution
- **PDF**: Embedded fonts, searchable text
- **Markdown**: Properly formatted, valid links
- **Naming**: Consistent, descriptive filenames
- **Organization**: Clear directory structure

## Output Summary

Provide:
1. List of exported files and locations
2. File sizes and formats
3. Preview of markdown documentation
4. Instructions for accessing exports
5. Suggestions for distribution/sharing