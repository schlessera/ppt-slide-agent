---
description: Create a professional PowerPoint presentation on any topic
allowed-tools: mcp__pptx__*, WebSearch, WebFetch, Read, Write, Bash
argument-hint: topic or description of the presentation
model: claude-3-5-sonnet-20241022
---

Create a comprehensive PowerPoint presentation about: $ARGUMENTS

## Process

1. **Research & Planning**
   - Research the topic thoroughly using web search if needed
   - Identify target audience and presentation purpose
   - Create a logical outline with 10-15 slides

2. **Presentation Creation**
   - Initialize presentation using `mcp__pptx__create_presentation`
   - Create title slide with compelling title and subtitle
   - Add agenda/overview slide
   - Create content slides following best practices:
     - One main idea per slide
     - 6-8 lines of text maximum
     - Use bullet points effectively
     - Include relevant visuals

3. **Content Structure**
   - Introduction (1-2 slides)
   - Main content (6-10 slides)
   - Data/evidence (1-2 slides)
   - Conclusion/summary (1 slide)
   - Q&A or contact information (1 slide)

4. **Design Elements**
   - Apply consistent color scheme
   - Use professional fonts (min 24pt for body text)
   - Include relevant images and graphics
   - Add charts or diagrams where appropriate
   - Ensure high contrast for readability

5. **Final Steps**
   - Add comprehensive speaker notes to each slide
   - Review for consistency and flow
   - Download presentation using `mcp__pptx__download_presentation`
   - Generate markdown overview with slide images

## Quality Standards
- Professional appearance
- Clear and logical flow
- Engaging visual design
- Accessible formatting
- Comprehensive speaker notes

## Output
Provide:
1. Confirmation of successful creation
2. Brief description of each slide
3. Presentation file location
4. Tips for effective delivery
5. Markdown documentation with PNG exports

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-review`
- **Purpose**: Assess quality and optimize presentation
- **Why Now**: Initial creation complete, needs refinement
- **Expected Time**: 10-15 minutes

### Alternative Next Steps:

1. **Quick Preview?**
   ```
   /slide-export
   ```
   - Use when: Need immediate preview
   - Formats: PDF, PNG, Markdown

2. **Manual Adjustments?**
   ```
   Edit specific slides directly
   ```
   - Use when: Minor tweaks needed
   - Tools: mcp__pptx__ tools

3. **Add Custom Elements?**
   ```
   /slide-diagram "[concept]"
   ```
   - Use when: Need specialized visuals
   - Types: flowchart, mindmap, timeline

### Quick Creation Workflow:
```
✅ Create (COMPLETE)
→  Review (RECOMMENDED)
   OR
→  Export (Quick sharing)
   OR  
→  Manual Edit (Specific changes)
```

### Before Sharing:
- [ ] Review all slides for accuracy
- [ ] Check speaker notes completeness
- [ ] Verify visual consistency
- [ ] Test on target display
- [ ] Create backup copy

### 💡 Pro Tips:
- Always review before important presentations
- Export to PDF for reliable sharing
- Test animations and transitions
- Practice with speaker notes
- Consider audience feedback for improvements