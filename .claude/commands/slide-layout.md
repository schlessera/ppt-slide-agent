---
description: Plan visual layout and composition for each slide
allowed-tools: Task, mcp__pptx__*, mcp__mermaid__*, Read, Write
argument-hint: presentation name or path to outline
model: claude-3-5-sonnet-20241022
---

Design visual layouts for presentation: $ARGUMENTS

## Layout Planning Process

### Phase 1: Visual Hierarchy Analysis

For each slide, the layout designer will:

1. **Content Prioritization** (Task: layout-designer)
   - Identify primary message (what eyes see first)
   - Supporting elements (secondary focus)
   - Contextual information (tertiary)
   - Navigation/meta elements

2. **Layout Pattern Selection**

   ```
   Layout Patterns Library:
   
   A. Hero Layout (Single Focus)
      ┌─────────────────────┐
      │                     │
      │    SINGLE WORD      │ ← 72pt+
      │                     │
      │   subtle tagline    │ ← 24pt
      └─────────────────────┘
      Use: Opening, transition, impact moments
   
   B. Split Screen
      ┌──────────┬──────────┐
      │          │  Title   │
      │  Visual  │ ─────────│
      │  (60%)   │  • Point │
      │          │  • Point │
      └──────────┴──────────┘
      Use: Concepts with supporting points
   
   C. Central Diagram
      ┌─────────────────────┐
      │      Title          │
      │   ┌─────────┐       │
      │   │ Diagram │       │
      │   └─────────┘       │
      │   Caption/Key       │
      └─────────────────────┘
      Use: Process flows, relationships
   
   D. Data Visualization
      ┌─────────────────────┐
      │ Title      [Legend] │
      │ ┌─────────────┐     │
      │ │    Chart    │     │
      │ └─────────────┘     │
      │ Key Insight ←       │
      └─────────────────────┘
      Use: Statistics, trends, comparisons
   
   E. Image Background
      ┌─────────────────────┐
      │░░░░░░░░░░░░░░░░░░░░│ ← Full bleed image
      │░░░░░░░░░░░░░░░░░░░░│
      │░░┌──────────┐░░░░░░│
      │░░│Text Box  │░░░░░░│ ← Semi-transparent
      │░░└──────────┘░░░░░░│
      └─────────────────────┘
      Use: Emotional impact, scene setting
   
   F. Comparison
      ┌─────────────────────┐
      │       Title         │
      │  ┌────┬────┐        │
      │  │ A  │ B  │        │
      │  ├────┼────┤        │
      │  │    │    │        │
      │  └────┴────┘        │
      └─────────────────────┘
      Use: Before/after, pros/cons
   ```

3. **Visual Element Specification**

   For each slide, specify:
   - Primary visual type (photo/illustration/diagram/chart/icon)
   - Visual size (full-bleed/large/medium/accent)
   - Position (center/left/right/background)
   - Treatment (color/B&W/duotone/overlay)

### Phase 2: Diagram Opportunity Identification

Analyze content for diagram potential:

1. **Process Flows** → Mermaid Flowchart
   - Sequential steps
   - Decision points
   - Parallel processes

2. **Relationships** → Mermaid Mindmap/Graph
   - Hierarchies
   - Networks
   - Connections

3. **Timelines** → Mermaid Gantt/Timeline
   - Chronological events
   - Project phases
   - Historical progression

4. **Proportions** → Mermaid Pie/Charts
   - Part-to-whole relationships
   - Distribution
   - Composition

5. **Journeys** → Mermaid Journey/Sequence
   - User experiences
   - Customer paths
   - Interaction flows

### Phase 3: White Space Planning

```
White Space Ratios:
- Hero slides: 60-70% white space
- Content slides: 40-50% white space
- Data slides: 30-40% white space

Margin System:
- Outer margins: 10% of slide width
- Internal padding: 5% of container
- Line spacing: 1.5x font size
- Element spacing: 2x line spacing
```

### Phase 4: Visual Flow Mapping

Create visual continuity:

1. **Consistent Elements**
   - Logo/brand position
   - Page numbers
   - Section indicators
   - Color coding

2. **Progressive Disclosure**
   - Build sequences
   - Reveal timing
   - Animation hints

3. **Visual Callbacks**
   - Recurring icons
   - Color associations
   - Shape language

## Output Format

```markdown
# Visual Layout Plan: [Presentation Name]

## Slide-by-Slide Layouts

### Slide 1: [Title]
**Layout Pattern**: Hero Layout
**Visual Hierarchy**:
  1. Main title (eye entry point)
  2. Subtitle (secondary read)
  3. Logo (tertiary)

**Visual Elements**:
- Background: Gradient or subtle pattern
- Typography: Bold sans-serif, 72pt
- Color: Brand primary

**Diagram Opportunity**: None

**White Space**: 65%

**Composition Notes**:
- Center-aligned for impact
- Breathing room above and below
- No competing elements

---

### Slide 2: [Title]
**Layout Pattern**: Split Screen
**Visual Hierarchy**:
  1. Image (left 60%)
  2. Headline (right top)
  3. Bullet points (right middle)

**Visual Elements**:
- Image: [Description, source, license]
- Icons: Replace bullets
- Color: Accent for emphasis

**Diagram Opportunity**: 
- Type: Flowchart
- Content: [Process to visualize]
- Style: Rounded rectangles, brand colors

**White Space**: 45%

[Continue for all slides...]

## Visual Consistency Guide

### Recurring Elements Map
```
┌─────────────────────────┐
│ Logo ←─────────────────┐│ Always top-right
│                        ││
│        Content         ││
│                        ││
│                 Page# →││ Always bottom-right
└─────────────────────────┘
```

### Animation Suggestions
- Slide 2: Fade in points sequentially
- Slide 5: Build diagram step-by-step
- Slide 8: Zoom into detail

### Accessibility Notes
- Minimum contrast ratio: 4.5:1
- Sans-serif fonts for readability
- Avoid red-green combinations
- Include alt text for all visuals

## Image Requirements List

1. **Hero Image** (Slide 2)
   - Specs: 1920x1080, high-res
   - Style: Professional, diverse
   - License: CC0 or purchased

2. **Supporting Images** (Slides 5, 8, 12)
   - Specs: 800x600 minimum
   - Style: Consistent filter/treatment
   - License: Attribution required

## Diagram Specifications

1. **Process Flow** (Slide 4)
   ```mermaid
   flowchart LR
     A[Start] --> B{Decision}
     B -->|Yes| C[Action 1]
     B -->|No| D[Action 2]
   ```

2. **Relationship Map** (Slide 7)
   ```mermaid
   mindmap
     root((Core))
       Branch1
         Leaf1
         Leaf2
       Branch2
         Leaf3
   ```

## Quality Metrics
□ Visual variety across slides
□ Consistent brand application
□ Appropriate white space
□ Clear focal points
□ Accessible design
□ Cultural appropriateness
```

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-design`
- **Purpose**: Create cohesive design system with colors and typography
- **Why Now**: Layout plans need visual styling decisions
- **Expected Time**: 10-15 minutes

### Alternative Next Steps:

1. **Revise Layout Plans?**
   ```
   /slide-layout "[specific slide numbers]"
   ```
   - Use when: Certain slides need different approach
   - Focus on: Problem slides identified

2. **Create Diagrams First?**
   ```
   /slide-diagram "[concept]"
   ```
   - Use when: Diagrams are central to message
   - Benefit: Can influence layout decisions

3. **Skip to Building?**
   ```
   /slide-build
   ```
   - Use when: Using existing brand guidelines
   - Note: Default design system will be applied

### Workflow Progress:
```
✅ Research
✅ Outline
✅ Layout (COMPLETE)
→  Design (NEXT)
   Build
   Review
```

### Before Proceeding, Verify:
- [ ] Each slide has clear visual hierarchy
- [ ] Layout patterns vary appropriately
- [ ] White space is adequate (30-60%)
- [ ] Diagram opportunities identified
- [ ] Image placements planned

### 💡 Pro Tips:
- Consider mobile/tablet viewing if sharing digitally
- Plan for both light and dark room presentations
- Ensure layouts work with colorblind viewers
- Test readability from back of room distance