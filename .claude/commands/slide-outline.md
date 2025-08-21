---
description: Generate or refine presentation outline with narrative flow
allowed-tools: Task, Read, Write, mcp__pptx__*, mcp__mermaid__*
argument-hint: presentation topic or path to research document
model: claude-3-5-sonnet-20241022
---

Create a compelling presentation outline for: $ARGUMENTS

## Outline Generation Process

### Phase 1: Structure Analysis

1. **Presentation Parameters**
   - Target duration (calculate slides: ~1-2 min per slide)
   - Audience sophistication level
   - Presentation context (pitch/education/report/workshop)
   - Desired outcome/call-to-action

2. **Narrative Architecture** (Task: outline-architect)
   - Story arc development (hook → tension → resolution)
   - Emotional journey mapping
   - Key message crystallization
   - Transition planning between sections

### Phase 2: Slide Planning

```yaml
Slide Structure:
  - Title Slide:
      duration: 30s
      elements: [title, subtitle, speaker, date]
      narrative: "Establish credibility"
  
  - Hook Slide:
      duration: 60s
      elements: [striking statistic, question, or image]
      narrative: "Create curiosity/urgency"
  
  - Agenda Slide:
      duration: 45s
      elements: [3-5 main sections]
      narrative: "Set expectations"
  
  - Content Slides (6-10):
      duration: 90-120s each
      types:
        - Concept Introduction (minimal text + visual)
        - Data Presentation (chart/graph + insight)
        - Case Study (story + outcome)
        - Comparison (before/after, pros/cons)
        - Process Flow (diagram + explanation)
      
  - Summary Slide:
      duration: 60s
      elements: [key takeaways in 3-5 points]
      narrative: "Reinforce main messages"
  
  - Call-to-Action Slide:
      duration: 45s
      elements: [specific next steps]
      narrative: "Drive action"
  
  - Thank You/Q&A Slide:
      duration: 30s
      elements: [contact info, resources]
```

### Phase 3: Content Distribution

For each slide, specify:

1. **Visual Layout Type**
   - Full-image background with overlay text
   - Split screen (visual left, points right)
   - Central diagram with annotations
   - Data visualization focus
   - Minimal text (1-3 words) with speaker elaboration

2. **Text Budget**
   - Title: 3-6 words
   - Body: Maximum 30 words total
   - Use fragments, not sentences
   - Prefer icons over bullet points

3. **Speaker Notes Structure**
   ```
   [HOOK] Opening line to grab attention
   [CONTEXT] Background information
   [KEY POINT] Main message (memorize this)
   [EVIDENCE] Supporting data/example
   [STORY] Personal anecdote (optional)
   [INTERACTION] Audience engagement
   [TRANSITION] Bridge to next slide
   [TIMING] Target: X seconds
   ```

### Phase 4: Flow Optimization

1. **Pacing Analysis**
   - Energy curve (start high, valley, peak, close strong)
   - Cognitive load distribution
   - Interactive moments placement
   - Breathing room between complex concepts

2. **Transition Mapping**
   - Logical connectors between slides
   - Visual continuity elements
   - Recurring themes/motifs
   - Callback references

## Output Format

```markdown
# Presentation Outline: [Title]

## Meta Information
- Duration: X minutes (Y slides)
- Audience: [Description]
- Objective: [Clear goal]
- Tone: [Professional/Casual/Inspirational]

## Slide Sequence

### Slide 1: [Title]
**Type**: Title Slide  
**Duration**: 30s  
**Visual**: [Description]  
**Text Content**: 
- Title: "[Main Title]"
- Subtitle: "[Subtitle]"

**Speaker Notes**:
[HOOK] ...
[KEY] ...
[TRANSITION] ...

### Slide 2: [Title]
[Continue format...]

## Visual Motifs
- Color story: [Progression through presentation]
- Recurring elements: [Icons, shapes, patterns]
- Typography hierarchy: [Heading/body/accent]

## Engagement Points
- Slide X: [Audience question]
- Slide Y: [Show of hands]
- Slide Z: [Think-pair-share]

## Risk Mitigation
- Complex concept (Slide X): Have backup explanation
- Technical demo (Slide Y): Screenshot fallback
- Time overrun: Slides X, Y skippable

## Success Metrics
□ Each slide under 40 words
□ No more than 3 key points per slide
□ Visual element on every slide
□ Clear narrative thread
□ Strong open and close
```

## Quality Checklist
- [ ] Story arc complete (beginning, middle, end)
- [ ] Cognitive load balanced
- [ ] Visual variety maintained
- [ ] Timing realistic
- [ ] Accessibility considered
- [ ] Cultural sensitivity checked
- [ ] Technical terms explained
- [ ] Call-to-action clear

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-layout`
- **Purpose**: Plan visual composition and hierarchy for each slide
- **Why Now**: Your outline needs visual structure planning
- **Expected Time**: 10-15 minutes

### Alternative Next Steps:

1. **Refine the Outline?**
   ```
   /slide-outline "[refined requirements]"
   ```
   - Use when: Stakeholder feedback requires changes
   - Focus on: Adjusting narrative flow or timing

2. **Jump to Design System?**
   ```
   /slide-design
   ```
   - Use when: Visual identity is top priority
   - Note: Layout can be adapted later

3. **Start Building Content?**
   ```
   /slide-build
   ```
   - Use when: Urgent deadline
   - Risk: May need more revisions later

### Workflow Progress:
```
✅ Research
✅ Outline (COMPLETE)
→  Layout (NEXT)
   Design
   Build
   Review
```

### Before Proceeding, Ensure:
- [ ] Slide count fits time constraint (1-2 min/slide)
- [ ] Story arc has clear beginning, middle, end
- [ ] Each slide has defined purpose
- [ ] Engagement points are distributed
- [ ] Transitions are logical

### 💡 Pro Tips:
- Review outline with stakeholders before layout
- Consider creating a "parking lot" slide for Q&A topics
- Mark slides that could be skipped if running short on time
- Note where animations or builds would be effective