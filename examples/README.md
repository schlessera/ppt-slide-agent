# PPT Slide Agent - Examples

## Quick Start Examples

### 1. Create a Simple Presentation
```
/slide-create "Introduction to Machine Learning"
```

### 2. Research a Topic First
```
/slide-research "Quantum Computing Applications"
```
Then create the presentation:
```
/slide-create "Quantum Computing Applications"
```

### 3. Optimize an Existing Presentation
```
/slide-optimize my-presentation.pptx
```

### 4. Export to Multiple Formats
```
/slide-export latest
```

## Advanced Examples

### Business Presentation
```
/slide-create "Q4 2024 Financial Report with revenue analysis, market trends, and 2025 projections"
```

### Academic Presentation
```
/slide-research "Latest developments in CRISPR gene editing"
/slide-create "CRISPR Gene Editing: Current State and Future Prospects"
```

### Technical Workshop
```
/slide-create "Docker and Kubernetes Workshop for Beginners - 2 hour hands-on session"
```

## Tips

1. **Be Specific**: The more detail you provide, the better the presentation
2. **Use Research First**: For unfamiliar topics, research before creating
3. **Iterate**: You can optimize presentations after creation
4. **Export Everything**: Always export to get markdown documentation with images

## MCP Tool Examples

If you want to use the MCP tools directly:

```python
# Create presentation
mcp__pptx__create_presentation("my-presentation")

# Add a title slide
mcp__pptx__add_slide("my-presentation", "title_slide")
mcp__pptx__add_text_to_slide("my-presentation", 0, "Welcome to My Presentation", 0, 44, True)

# Add content slide
mcp__pptx__add_slide("my-presentation", "title_and_content")
mcp__pptx__add_text_to_slide("my-presentation", 1, "Key Points", 0, 32, True)
mcp__pptx__add_text_to_slide("my-presentation", 1, "• First point\n• Second point\n• Third point", 1)

# Save presentation
mcp__pptx__download_presentation("my-presentation")
```