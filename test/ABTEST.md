# A/B Test: Net Promoter Score

## Test Name
**Net Promoter Score: Rating Scale: 1-6 (-1 points) vs 9-10 (+1 point)**

## User Story Number
This A/B test corresponds to User Story US3 (User Feedback Collection).

## Metrics
The metrics measured in this A/B test include:
- **Net Promoter Score (NPS)**: Primary metric to measure customer satisfaction and loyalty based on user recommendations.
- **Adoption**: Whether the NPS system encourages more feedback and user engagement.
- **Retention**: Impact of the new NPS system on user return rates.
- **Completion Rate**: Percentage of users completing and submitting their NPS score.
- **User Sentiment**: Effect of different scoring ranges on overall user feedback and behavior.

## Hypothesis
We hypothesize that:
- A stricter NPS scale, with negative points for scores 1-6, will provide more accurate feedback from less satisfied users.
- Scores 9-10 will encourage promoters to express genuine satisfaction.
- This stricter scoring may lower average scores but will better identify promoters, detractors, and neutral users, improving customer experience based on clearer feedback.

## Problem Statement
### Problem
Current NPS feedback may be too lenient, with mid-range scores (7-8) not classifying users as promoters or detractors, leading to inflated positive feedback.

### Impact
Refining the scoring system will:
- Improve accuracy of user feedback.
- Retain users who might be misclassified as neutral.
- Focus efforts on improving satisfaction and retention for detractors.

### Hypothesis
Assigning negative points for low scores (1-6) and positive points for high scores (9-10) will provide clearer user sentiment, aiding in more effective app improvements.

## Experiment Design
We will set up an A/B test using Firebase's Remote Config with two variations:
1. **Variation A (Current NPS Scale)**: Users rate from 1 to 10, with no points assigned.
2. **Variation B (Stricter NPS Scale)**: 
   - 1-6 scores receive -1 point.
   - 7-8 scores receive 0 points.
   - 9-10 scores receive +1 point.

### Audiences
- 50% of users will experience Variation A.
- 50% will experience Variation B.

### Tracking Setup
Using Firebase Analytics, we will track:
- **NPS Score Submitted**: To see if users are more likely to complete the survey.
- **Retention**: Correlation between high NPS scores and user return rates.
- **Adoption and CTR**: User engagement with the NPS rating system.

### Variations
#### Variation A - Current NPS Rating (No Point System)
- Users submit a rating from 1 to 10.
- Promoters: 9-10, Detractors: 1-6, Neutral: 7-8.
- No points assigned.

#### Variation B - Point-based NPS System
- Scores categorized with points:
  - 1-6 (-1 point): Detractors.
  - 7-8 (0 points): Neutral.
  - 9-10 (+1 point): Promoters.
- Optional: Show point-based system to users after submission.

## Next Steps
1. **Implement Firebase Remote Config**: Toggle between variations and assign users.
2. **Analyze Metrics**: Compare NPS scores, retention, adoption, and feedback quality.
3. **Iterate**: Implement the winning variation into the app and adjust the NPS survey system accordingly.

This approach aims to refine the feedback system, leading to better user satisfaction insights.

You can view the file [here](https://github.com/CSC-305-app/TuneTailor/blob/wtsafack-patch-3/ABTEST.md).
