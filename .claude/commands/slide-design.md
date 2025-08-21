---
description: Create comprehensive design system and styleguide for presentation
allowed-tools: Task, mcp__pptx__*, Read, Write, WebSearch
argument-hint: presentation theme or brand guidelines
model: claude-3-5-sonnet-20241022
---

Generate design system for presentation: $ARGUMENTS

## Design System Creation Process

### Phase 1: Design Foundation (Task: design-system-creator)

1. **Color Palette Generation**

   ```yaml
   Color System:
     Primary Palette:
       primary: "#1E40AF"      # Main brand color
       primary-light: "#3B82F6" # Lighter variation
       primary-dark: "#1E3A8A"  # Darker variation
     
     Secondary Palette:
       accent: "#F59E0B"        # Call-to-action, highlights
       accent-light: "#FCD34D"  # Subtle highlights
       accent-dark: "#D97706"   # Strong emphasis
     
     Neutral Palette:
       text-primary: "#1F2937"  # Main text
       text-secondary: "#6B7280" # Supporting text
       text-tertiary: "#9CA3AF" # Meta information
       background: "#FFFFFF"    # Slide background
       surface: "#F9FAFB"       # Card backgrounds
       border: "#E5E7EB"        # Dividers
     
     Semantic Colors:
       success: "#10B981"       # Positive metrics
       warning: "#F59E0B"       # Caution points
       error: "#EF4444"         # Problems/risks
       info: "#3B82F6"          # Information
     
     Application Rules:
       - Headers: primary-dark
       - Body text: text-primary
       - Captions: text-secondary
       - Links/CTAs: accent
       - Charts: Use primary palette + accent
       - Backgrounds: 95% white, 5% surface
   ```

2. **Typography System**

   ```yaml
   Typography:
     Font Families:
       heading: "Inter, SF Pro Display, Segoe UI"
       body: "Inter, SF Pro Text, Segoe UI"
       mono: "JetBrains Mono, SF Mono, Consolas"
     
     Size Scale:
       hero: 72pt      # Single word slides
       h1: 44pt        # Slide titles
       h2: 32pt        # Section headers
       h3: 28pt        # Subheadings
       body: 24pt      # Main content
       caption: 18pt   # Supporting text
       micro: 14pt     # Footnotes, attributions
     
     Weight Scale:
       black: 900      # Hero text
       bold: 700       # Headlines
       semibold: 600   # Emphasis
       regular: 400    # Body text
       light: 300      # Large quotes
     
     Line Heights:
       tight: 1.1      # Headlines
       normal: 1.5     # Body text
       relaxed: 1.75   # Quotes
     
     Application:
       - Slide titles: h1, bold, tight
       - Body points: body, regular, normal
       - Emphasis: body, semibold
       - Quotes: h2, light, relaxed
   ```

3. **Spacing System**

   ```yaml
   Spacing:
     Base Unit: 8px
     
     Scale:
       xs: 8px   # Inline spacing
       sm: 16px  # Between related items
       md: 24px  # Between sections
       lg: 32px  # Major sections
       xl: 48px  # Slide padding
       xxl: 64px # Hero spacing
     
     Grid System:
       columns: 12
       gutter: 24px
       margin: 48px
     
     Component Spacing:
       - Bullet points: sm between items
       - Sections: lg between sections
       - Slide padding: xl all sides
       - Title to content: md
   ```

4. **Visual Elements**

   ```yaml
   Visual Style:
     Corners:
       radius-sm: 4px   # Buttons, small cards
       radius-md: 8px   # Cards, containers
       radius-lg: 16px  # Images, large cards
       radius-full: 999px # Pills, avatars
     
     Shadows:
       sm: "0 1px 2px rgba(0,0,0,0.05)"
       md: "0 4px 6px rgba(0,0,0,0.07)"
       lg: "0 10px 15px rgba(0,0,0,0.1)"
       xl: "0 20px 25px rgba(0,0,0,0.15)"
     
     Borders:
       width: 1px
       style: solid
       color: border (#E5E7EB)
     
     Icons:
       style: "outlined"  # outlined, filled, duo-tone
       size: 24px standard, 32px emphasis
       color: Inherit from text color
     
     Images:
       treatment: "natural" # natural, duotone, grayscale
       overlay: "gradient"  # For text on images
       opacity: 0.9        # Slight transparency
   ```

### Phase 2: Component Patterns

```yaml
Components:
  Title Slide:
    background: gradient(primary to primary-light)
    title: white, hero size, black weight
    subtitle: white, h2 size, regular weight
    spacing: xxl padding
  
  Content Slide:
    background: white
    title: primary-dark, h1, bold
    body: text-primary, body, regular
    accents: accent color for emphasis
  
  Quote Slide:
    background: surface
    quote: text-primary, h2, light, italic
    attribution: text-secondary, caption, regular
    decoration: Large accent quotation marks
  
  Data Slide:
    background: white
    title: primary-dark, h2, bold
    chart-colors: [primary, accent, primary-light]
    labels: text-secondary, caption
    callout: accent background, white text
  
  Image Slide:
    image: full-bleed or large with padding
    overlay: gradient(transparent to primary @70%)
    text: white, h2, bold
    caption: white, caption, regular
```

### Phase 3: Diagram Styling

```yaml
Mermaid Diagram Themes:
  flowchart:
    theme: base
    primaryColor: ${primary}
    primaryTextColor: white
    primaryBorderColor: ${primary-dark}
    lineColor: ${border}
    secondaryColor: ${accent}
    tertiaryColor: ${surface}
    background: white
    
  mindmap:
    theme: base
    primaryColor: ${primary}
    secondaryColor: ${accent}
    tertiaryColor: ${primary-light}
    primaryTextColor: white
    
  sequence:
    theme: base
    actorBkg: ${primary}
    actorTextColor: white
    activationBorderColor: ${accent}
    sequenceNumberColor: white
```

### Phase 4: Accessibility Standards

```yaml
Accessibility:
  Contrast Ratios:
    large-text: 3:1 minimum (24pt+)
    normal-text: 4.5:1 minimum
    ui-elements: 3:1 minimum
  
  Color Blind Safe:
    - Never rely on color alone
    - Use patterns/icons as supplements
    - Test with deuteranopia filter
  
  Font Requirements:
    - Minimum 18pt for presentations
    - Sans-serif for body text
    - Adequate letter spacing
    - Avoid all-caps for paragraphs
  
  Visual Indicators:
    - Focus states for interactive elements
    - Clear hierarchy through size/weight
    - Consistent positioning
```

## Output Format

```markdown
# Design System: [Presentation Name]

## Quick Reference Card

### Colors
- **Primary**: #1E40AF (headers, emphasis)
- **Accent**: #F59E0B (CTAs, highlights)
- **Text**: #1F2937 (body content)
- **Background**: #FFFFFF (slides)

### Typography
- **Titles**: Inter Bold 44pt
- **Body**: Inter Regular 24pt
- **Captions**: Inter Regular 18pt

### Spacing
- **Slide Padding**: 48px
- **Between Elements**: 24px
- **Line Height**: 1.5x

## Slide Templates

[Visual mockups of each slide type with measurements]

## Do's and Don'ts

### Do's ✓
- Maintain consistent color usage
- Use plenty of white space
- Keep text minimal and impactful
- Ensure high contrast

### Don'ts ✗
- Mix more than 3 fonts
- Use more than 5 colors
- Crowd slides with content
- Use low-contrast combinations

## Implementation Checklist
□ Color palette applied
□ Typography hierarchy set
□ Spacing consistent
□ Accessibility verified
□ Brand alignment confirmed
```

## Style Application Script

Generate Python script to apply design system:

```python
def apply_design_system(presentation):
    """Apply design system to presentation"""
    
    # Color definitions
    colors = {
        'primary': RGBColor(30, 64, 175),
        'accent': RGBColor(245, 158, 11),
        'text': RGBColor(31, 41, 55),
        # ... more colors
    }
    
    # Typography settings
    fonts = {
        'heading': {'name': 'Inter', 'bold': True, 'size': Pt(44)},
        'body': {'name': 'Inter', 'bold': False, 'size': Pt(24)},
        # ... more fonts
    }
    
    # Apply to all slides
    for slide in presentation.slides:
        apply_slide_styling(slide, colors, fonts)
```

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-build`
- **Purpose**: Build the complete presentation with all elements
- **Why Now**: Design system is ready to be applied
- **Expected Time**: 15-20 minutes

### Alternative Next Steps:

1. **Test Design on Sample?**
   ```
   /slide-create "[single test slide]"
   ```
   - Use when: Want to preview design before full build
   - Benefit: Quick validation of design choices

2. **Create Custom Diagrams?**
   ```
   /slide-diagram "[diagram type]"
   ```
   - Use when: Complex diagrams need design integration
   - Note: Apply design system colors to diagrams

3. **Curate Images First?**
   ```
   Task: image-curator
   ```
   - Use when: Visual assets are critical
   - Benefit: Ensures brand-appropriate imagery

### Workflow Progress:
```
✅ Research
✅ Outline
✅ Layout
✅ Design (COMPLETE)
→  Build (NEXT)
   Review
```

### Before Proceeding, Verify:
- [ ] Color palette is accessible (WCAG AA)
- [ ] Typography scale is consistent
- [ ] Design aligns with brand guidelines
- [ ] Contrast ratios meet standards
- [ ] Color-blind safe palette

### 💡 Pro Tips:
- Save design system as template for future use
- Create style guide slide for consistency reference
- Test design with sample content first
- Consider creating light/dark theme variants