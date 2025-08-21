---
description: Build complete presentation with all visual and content elements
allowed-tools: Task, mcp__pptx__*, mcp__mermaid__*, WebSearch, WebFetch, Read, Write
argument-hint: presentation specifications or path to outline and design documents
model: claude-3-5-sonnet-20241022
---

Build complete presentation: $ARGUMENTS

## Parallel Build Process

### Phase 1: Initialize and Prepare

1. **Load Resources**
   - Read outline document
   - Load design system
   - Parse layout specifications
   - Prepare asset list

2. **Create Presentation** 
   ```python
   mcp__pptx__create_presentation(name, template="blank")
   ```

### Phase 2: Parallel Component Creation

Launch simultaneous tasks:

```yaml
Parallel Tasks:
  Task Group 1 - Visual Assets:
    - image-curator: Fetch and validate images
    - diagram-specialist: Generate Mermaid diagrams
    - icon-finder: Locate appropriate icons
  
  Task Group 2 - Content Optimization:
    - content-optimizer: Refine text to word limits
    - speaker-note-writer: Create narrative notes
    - citation-formatter: Prepare references
  
  Task Group 3 - Design Elements:
    - color-applier: Set up color schemes
    - font-configurator: Configure typography
    - layout-implementer: Set up slide templates
```

### Phase 3: Slide Assembly

For each slide in sequence:

```python
# Slide Creation Pattern
def create_slide(slide_spec):
    # 1. Add slide with layout
    slide_id = mcp__pptx__add_slide(
        presentation_name=name,
        layout=slide_spec['layout_type']
    )
    
    # 2. Apply design system
    apply_colors(slide_id, design_system['colors'])
    apply_fonts(slide_id, design_system['typography'])
    
    # 3. Add content elements
    if slide_spec['has_title']:
        add_styled_text(
            slide_id, 
            title_text,
            position=0,
            style=design_system['title_style']
        )
    
    # 4. Add visual elements
    if slide_spec['has_image']:
        mcp__pptx__add_image_to_slide(
            presentation_name=name,
            slide_index=slide_id,
            image_path=optimized_image_path,
            left=layout['image_position']['x'],
            top=layout['image_position']['y'],
            width=layout['image_size']['width'],
            height=layout['image_size']['height']
        )
    
    # 5. Add diagrams if specified
    if slide_spec['has_diagram']:
        diagram_image = generate_mermaid_diagram(
            slide_spec['diagram_spec'],
            design_system['diagram_theme']
        )
        add_diagram_to_slide(slide_id, diagram_image)
    
    # 6. Add speaker notes
    mcp__pptx__add_speaker_notes(
        presentation_name=name,
        slide_index=slide_id,
        notes=formatted_speaker_notes
    )
```

### Phase 4: Content Rules Engine

```yaml
Text Optimization Rules:
  Title:
    max_words: 6
    max_chars: 50
    style: "Impact phrase, not sentence"
  
  Body:
    max_words_per_slide: 30
    max_words_per_bullet: 8
    max_bullets: 4
    style: "Fragments, not sentences"
  
  Transformations:
    - "The process of X" → "X Process"
    - "In order to" → "To"
    - "It is important that" → [Remove]
    - "Studies have shown" → [Remove]
    - Convert sentences to fragments
    - Remove articles (a, an, the) where possible
    - Use active voice
    - Replace phrases with single words
```

### Phase 5: Visual Enhancement

```python
def enhance_slide_visuals(slide):
    """Apply visual enhancements"""
    
    # 1. Background treatments
    if slide.type == 'hero':
        add_gradient_background(
            colors=[design.primary, design.primary_light],
            direction='diagonal'
        )
    elif slide.type == 'image_full':
        add_image_overlay(opacity=0.3, color=design.primary)
    
    # 2. Shape elements
    if slide.needs_emphasis:
        add_shape(
            type='rounded_rect',
            fill=design.accent,
            position=emphasis_area
        )
    
    # 3. Icons as bullet replacements
    for bullet in slide.bullets:
        replace_bullet_with_icon(
            bullet,
            icon=select_relevant_icon(bullet.text),
            color=design.primary
        )
    
    # 4. Data visualizations
    if slide.has_data:
        create_chart(
            data=slide.data,
            chart_type=best_chart_for_data(slide.data),
            color_scheme=design.chart_colors
        )
```

### Phase 6: Quality Assurance

```yaml
Quality Checks:
  Content:
    - Word count per slide ≤ 30
    - Font size ≥ 24pt for body
    - Contrast ratio ≥ 4.5:1
    - No orphaned bullets
    - Speaker notes present
  
  Visual:
    - Images properly sized
    - Consistent alignment
    - Proper spacing applied
    - Brand colors used
    - No stretched images
  
  Technical:
    - File size optimized
    - Images compressed
    - Fonts embedded
    - Links working
    - Animations smooth
```

## Output Deliverables

### 1. Primary Presentation File
```
presentations/
├── [name].pptx          # Main PowerPoint file
├── [name]_backup.pptx   # Backup version
└── exports/
    ├── [name].pdf       # PDF version
    ├── slides/          # Individual slide images
    │   ├── slide_01.png
    │   ├── slide_02.png
    │   └── ...
    └── [name]_notes.md  # Speaker notes document
```

### 2. Documentation Package
```markdown
# Presentation: [Name]

## Quick Stats
- Slides: X
- Duration: Y minutes
- Word count: Z (avg W per slide)
- Images: X (with attributions)
- Diagrams: Y

## Slide Inventory
| # | Title | Type | Words | Visual | Notes |
|---|-------|------|-------|--------|-------|
| 1 | ... | Title | 8 | Gradient | ✓ |
| 2 | ... | Content | 25 | Image | ✓ |

## Visual Assets
### Images Used
1. [Image 1]: Source, License, Attribution
2. [Image 2]: Source, License, Attribution

### Diagrams Created
1. [Diagram 1]: Type, Purpose
2. [Diagram 2]: Type, Purpose

## Design Compliance
✓ Color palette applied consistently
✓ Typography hierarchy maintained
✓ Spacing grid followed
✓ Accessibility standards met

## Speaker Notes Summary
[First 100 words of speaker notes for each slide]

## Presentation Tips
1. Practice the opening hook
2. Key timing milestones
3. Interaction points
4. Technical requirements
```

### 3. Attribution File
```markdown
# Image Attributions

## Slide 2
- Image: "Team Collaboration"
- Source: Unsplash
- Photographer: John Doe
- License: Unsplash License (Free)
- URL: https://unsplash.com/photos/...
- Required Attribution: None

## Slide 5
- Image: "Data Visualization"
- Source: Pexels
- Photographer: Jane Smith
- License: CC0
- URL: https://pexels.com/...
- Required Attribution: None

[Continue for all images...]
```

## Success Metrics
- [ ] All slides under word limit
- [ ] Visual element on every slide
- [ ] Speaker notes comprehensive
- [ ] Design system applied
- [ ] Attributions documented
- [ ] Export formats generated
- [ ] File size < 50MB
- [ ] Load time < 3 seconds

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-review`
- **Purpose**: Perform quality assessment and iterative improvements
- **Why Now**: Initial build complete, needs optimization
- **Expected Time**: 10-15 minutes

### Alternative Next Steps:

1. **Quick Export?**
   ```
   /slide-export
   ```
   - Use when: Need to share draft immediately
   - Note: Can review after stakeholder feedback

2. **Add Custom Elements?**
   ```
   /slide-diagram "[specific concept]"
   ```
   - Use when: Need specialized visualizations
   - Focus on: Complex concepts needing diagrams

3. **Manual Refinement?**
   ```
   Edit specific slides directly
   ```
   - Use when: Minor tweaks needed
   - Tools: Edit, MultiEdit commands

### Workflow Progress:
```
✅ Research
✅ Outline
✅ Layout
✅ Design
✅ Build (COMPLETE)
→  Review (NEXT)
```

### Quality Quick Check:
- [ ] All slides load properly
- [ ] Images display correctly
- [ ] Text is readable
- [ ] No overflow issues
- [ ] Speaker notes present

### 💡 Pro Tips:
- Save a backup before review process
- Test presentation on target display/projector
- Check animations and transitions work
- Verify all links are functional
- Consider creating handout version