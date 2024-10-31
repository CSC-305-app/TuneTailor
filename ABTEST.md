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

# A/B Test: Sign-in options 


## Test Name 
**More sign-in options on the start page vs. click-to-popup for additional sign-in options**
## User Story Number
US1 Account Creation

## Metrics 
Track the percentage of users who select each sign-in option, as well as the overall sign-in conversion rate from the start page.

## Hypothesis

### Problem Statement
Currently, the sign-in page presents users with limited options at the start, requiring an extra click to reveal all available sign-in methods. We want to see if directly displaying more sign-in options on the start page will reduce friction and increase account creation. The primary bottleneck is the extra click required to see additional sign-in methods, which could discourage users who don’t see their preferred method immediately.

### Hypothesis
Displaying more sign-in options on the start page will improve the user experience by minimizing the number of steps needed to sign in. This reduced friction will lead to an increase in the use of alternative sign-in methods and a higher sign-in conversion rate, as users are more likely to choose an option they’re comfortable with if it’s readily visible.

## Experiment

### Audience 
The experiment will be shown to 50% of users, with the remaining 50% seeing the current design (control group). This split will allow for a statistically significant comparison while limiting potential disruption to the user base.

### Tracking in Firebase Analytics:
Set up an event to track which sign-in option each user selects, including options like Google, Spotify, Apple Music, or email.
Track conversions to determine the overall percentage of users who complete the sign-in process for each variation.
Use the HEART framework to track Engagement (e.g., time spent on the sign-in page) and Adoption (e.g., successful account creation per variation).

### Expected Outcome
Users exposed to the “more sign-in options on the start page” variation are expected to show higher engagement and account creation rates.

## Variations
### Control
Users see a “More sign in options” button, which, when clicked, opens a popup displaying all available sign-in options.

### Variation 
All available sign-in options (e.g., Google, Spotify, Apple Music) are displayed directly on the start page. Users can immediately select their preferred method without additional clicks.

### Design Mockups:
**Control Group**: Start page with one primary “More sign in options” button leading to a popup with multiple options.

**Variation Group**: Start page with multiple sign-in options displayed directly (e.g., Google, Spotify, Apple Music).

## Test Name
**Playlist Curation – Personalized Recommendations vs. Genre-Based Suggestions**

## User Story Number: 
US4 (Playlist Creation and Recommendation)

## Metrics
Engagement: Total number of playlists generated per user
Adoption: Percentage of new users who generate a playlist within the first session
Retention: Percentage of returning users who use the playlist creation feature
Satisfaction: User feedback scores on playlist quality (e.g., using in-app surveys)
Hypothesis: Users will find personalized playlist suggestions based on their cross-platform listening history more engaging and relevant than genre-based playlists. This will increase initial engagement and user satisfaction with the app, leading to higher retention rates.

## Problem Statement
Currently, new users struggle to feel immediately connected to the playlists generated, as they’re not based on individual preferences. Many new users don’t explore the app deeply if the initial playlists don’t resonate, which leads to high drop-off rates. We want to make the onboarding experience more engaging by immediately suggesting playlists that feel personalized. By testing personalized recommendations versus genre-based suggestions, we aim to identify which approach creates a stronger initial user connection and drives retention.

## Experiment
Using Firebase Remote Config, set up an A/B test to serve different playlist creation algorithms to new users. Group A (50%) will receive personalized playlist recommendations based on their cross-platform music data, while Group B (50%) will receive playlists sorted by popular genres. Track the following HEART metrics for each group:

## Engagement:
Monitor the number of playlists generated per session and per user

## Retention: 
Track returning user rates over 7 and 30 days

## Satisfaction:
Implement an optional 5-star rating for each playlist created and follow-up questions in Firebase In-App Messaging to gather qualitative feedback
Firebase Analytics will be used to tag and track engagement with these playlist recommendations and capture usage trends between the two groups. We’ll also set up Firebase Predictions to see which group shows a higher likelihood of churn.

**Variations:
Variation A: Personalized recommendations based on user preferences from multiple streaming services.
Variation B: Genre-based playlists (e.g., Top 40s, Rock, Chill, etc.), using popular music genres instead of personal data.
