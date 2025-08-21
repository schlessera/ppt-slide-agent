---
description: Iterative quality review and optimization of presentation
allowed-tools: Task, mcp__pptx__*, Read, Write, Bash
argument-hint: presentation name for review and optimization
model: claude-3-5-sonnet-20241022
---

Review and optimize presentation: $ARGUMENTS

## Iterative Review Process

### Phase 1: Screenshot Extraction

```python
# Extract screenshots for review
def extract_all_slides():
    """Generate PNG of each slide for analysis"""
    for i, slide in enumerate(presentation.slides):
        mcp__pptx__render_slide_to_image(
            presentation_name=name,
            slide_index=i,
            output_path=f"review/slide_{i:02d}.png"
        )
    return screenshot_paths
```

### Phase 2: Multi-Dimensional Quality Assessment

Launch parallel quality reviews (Task: quality-reviewer):

```yaml
Review Dimensions:

1. Design Consistency Score (0-100):
   Criteria:
   - Color palette adherence
   - Typography consistency
   - Spacing uniformity
   - Visual style coherence
   - Brand alignment

2. Content Quality Score (0-100):
   Criteria:
   - Text density (target: <40 words)
   - Clarity of message
   - Logical flow
   - Grammar and spelling
   - Technical accuracy

3. Visual Impact Score (0-100):
   Criteria:
   - Visual hierarchy effectiveness
   - Image quality and relevance
   - Chart/diagram clarity
   - White space utilization
   - Emotional engagement

4. Accessibility Score (0-100):
   Criteria:
   - Color contrast ratios
   - Font size adequacy
   - Alt text presence
   - Color-blind friendliness
   - Screen reader compatibility

5. Technical Score (0-100):
   Criteria:
   - File size optimization
   - Load performance
   - Animation smoothness
   - Link functionality
   - Cross-platform compatibility
```

### Phase 3: Issue Identification and Prioritization

```python
def analyze_slide_issues(slide_screenshot, slide_content):
    """Identify specific issues for improvement"""
    
    issues = []
    
    # Text Density Analysis
    word_count = count_words(slide_content)
    if word_count > 40:
        issues.append({
            'severity': 'high',
            'type': 'text_density',
            'issue': f'Slide has {word_count} words (target: <40)',
            'suggestion': 'Reduce text by 50%, move details to speaker notes'
        })
    
    # Visual Balance Analysis
    if not has_visual_element(slide_screenshot):
        issues.append({
            'severity': 'medium',
            'type': 'visual_missing',
            'issue': 'No visual element present',
            'suggestion': 'Add relevant image, icon, or diagram'
        })
    
    # Contrast Analysis
    contrast_ratio = measure_contrast(slide_screenshot)
    if contrast_ratio < 4.5:
        issues.append({
            'severity': 'high',
            'type': 'accessibility',
            'issue': f'Low contrast ratio: {contrast_ratio}',
            'suggestion': 'Darken text or lighten background'
        })
    
    # Font Size Analysis
    min_font_size = detect_minimum_font_size(slide_screenshot)
    if min_font_size < 24:
        issues.append({
            'severity': 'medium',
            'type': 'readability',
            'issue': f'Font size too small: {min_font_size}pt',
            'suggestion': 'Increase to minimum 24pt'
        })
    
    return issues
```

### Phase 4: Improvement Implementation

```yaml
Improvement Workflow:
  
  For each issue by priority:
    
    1. Text Reduction:
       Original: "The implementation of this strategy will result in..."
       Improved: "Strategy results:"
       
       Actions:
       - Extract core message
       - Remove filler words
       - Convert to fragments
       - Move details to notes
    
    2. Visual Addition:
       Identify concept → Select visual type → Generate/fetch → Insert
       
       Types:
       - Abstract concept → Icon or illustration
       - Process → Flowchart diagram
       - Comparison → Side-by-side visual
       - Data → Chart or graph
       - Story → Photography
    
    3. Layout Rebalancing:
       - Increase white space
       - Align elements to grid
       - Establish clear hierarchy
       - Remove redundant elements
    
    4. Color Correction:
       - Apply brand colors
       - Increase contrast
       - Fix accessibility issues
       - Ensure consistency
    
    5. Typography Fix:
       - Increase font sizes
       - Apply weight hierarchy
       - Fix line spacing
       - Ensure readability
```

### Phase 5: Iterative Improvement Loop

```python
def iterative_optimization(presentation, target_score=85):
    """
    Continuously improve until quality threshold reached
    """
    iteration = 0
    max_iterations = 5
    
    while iteration < max_iterations:
        iteration += 1
        
        # Step 1: Extract current state
        screenshots = extract_all_slides()
        
        # Step 2: Analyze quality
        scores = analyze_quality(screenshots)
        overall_score = calculate_overall_score(scores)
        
        print(f"Iteration {iteration}: Score = {overall_score}/100")
        
        # Step 3: Check if target reached
        if overall_score >= target_score:
            print(f"✓ Target score reached: {overall_score}")
            break
        
        # Step 4: Generate improvements
        improvements = generate_improvement_plan(scores)
        
        # Step 5: Apply improvements
        for improvement in improvements:
            apply_improvement(presentation, improvement)
        
        # Step 6: Save iteration
        save_backup(presentation, f"iteration_{iteration}")
    
    return presentation, overall_score
```

### Phase 6: Final Quality Report

```markdown
# Presentation Quality Report

## Overall Score: 87/100 ⭐⭐⭐⭐

### Detailed Scores
- **Design Consistency**: 92/100 ✓
- **Content Quality**: 88/100 ✓
- **Visual Impact**: 85/100 ✓
- **Accessibility**: 90/100 ✓
- **Technical**: 95/100 ✓

## Improvement Summary

### Iteration 1 (Score: 72 → 79)
- Reduced text on 8 slides (avg 65 → 35 words)
- Added visual elements to 5 slides
- Fixed contrast issues on 3 slides

### Iteration 2 (Score: 79 → 84)
- Improved visual hierarchy on 6 slides
- Added diagrams to 3 concept slides
- Enhanced speaker notes for all slides

### Iteration 3 (Score: 84 → 87)
- Fine-tuned typography consistency
- Optimized image quality and size
- Added motion design suggestions

## Slide-by-Slide Analysis

| Slide | Before | After | Improvements |
|-------|--------|-------|--------------|
| 1 | 68 | 92 | Reduced text, added gradient |
| 2 | 71 | 88 | Added image, improved layout |
| 3 | 65 | 85 | Created diagram, reduced bullets |
| ... | ... | ... | ... |

## Remaining Recommendations

### High Priority
1. Slide 7: Consider splitting into two slides
2. Slide 12: Add supporting visual for data

### Medium Priority
1. Overall: Add subtle animations
2. Slide 5: Enhance color coding

### Low Priority
1. Consider custom icons for consistency
2. Add progress indicators

## Accessibility Compliance
✓ WCAG AA compliant
✓ Color blind safe
✓ Screen reader optimized
✓ Keyboard navigable

## Performance Metrics
- File size: 12.3 MB (optimized from 28.5 MB)
- Load time: 1.8 seconds
- Render time: 0.3 seconds per slide
- Compatibility: PowerPoint 2013+

## Sign-off Checklist
- [✓] All text under 40 words per slide
- [✓] Visual element on every slide
- [✓] Speaker notes complete
- [✓] Design system applied
- [✓] Accessibility verified
- [✓] Performance optimized
- [✓] Backups created
- [✓] Ready for presentation
```

## Review Automation Script

```python
# Auto-review script for continuous improvement
def auto_review_and_fix(presentation_name):
    """
    Automated review and fixing pipeline
    """
    
    # Configure review parameters
    config = {
        'target_score': 85,
        'max_iterations': 5,
        'auto_fix': True,
        'backup_each_iteration': True
    }
    
    # Run review pipeline
    results = iterative_optimization(
        presentation_name,
        config['target_score']
    )
    
    # Generate reports
    generate_quality_report(results)
    generate_before_after_comparison(results)
    generate_speaker_confidence_notes(results)
    
    return results
```

## Success Criteria
- Overall quality score ≥ 85/100
- No critical accessibility issues
- All slides under word limit
- Consistent design application
- Positive visual impact
- Complete speaker notes
- Optimized performance

## 🎯 Next Steps

### Recommended Next Action:
**Command**: `/slide-export`
- **Purpose**: Generate final deliverables in multiple formats
- **Why Now**: Quality standards met, ready for distribution
- **Expected Time**: 5-10 minutes

### Alternative Actions:

1. **Another Review Iteration?**
   ```
   /slide-review --target-score 90
   ```
   - Use when: Pursuing excellence
   - Note: Diminishing returns above 85

2. **Manual Polish?**
   ```
   Edit [specific slides]
   ```
   - Use when: Specific issues remain
   - Focus on: Slides below 80 score

3. **Create Variations?**
   ```
   /slide-create "[audience variant]"
   ```
   - Use when: Multiple audiences
   - Example: Technical vs Executive version

### Workflow Progress:
```
✅ Research
✅ Outline
✅ Layout
✅ Design
✅ Build
✅ Review (COMPLETE)
→  Export/Deliver (FINAL)
```

### Post-Review Checklist:
- [ ] Quality score ≥ 85/100 achieved
- [ ] All critical issues resolved
- [ ] Stakeholder feedback incorporated
- [ ] Final proofread complete
- [ ] Ready for presentation

### 💡 Pro Tips:
- Create a "lessons learned" document
- Save high-scoring slides as templates
- Note which improvements had biggest impact
- Consider A/B testing with audience
- Archive version before any last-minute changes

### 🎉 Congratulations!
Your presentation has passed quality review and is ready for delivery. Remember to:
- Practice your delivery with the speaker notes
- Test on actual presentation equipment
- Have a backup copy available
- Arrive early to test setup