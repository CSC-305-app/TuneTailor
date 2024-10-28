A/B Test Name:
“Net Promoter Score: Rating Scale: 1-6 (-1 points) vs 9-10 (+1 point)”
User Story Number:
This A/B test would be a task under US3 (User Feedback Collection).
Metrics:
The metrics that this A/B test would measure include:
Net Promoter Score (NPS): The primary metric. It measures customer satisfaction and loyalty based on how likely users are to recommend the app.
Adoption: If the NPS system encourages users to provide more feedback and stay engaged with the app.
Retention: Measuring how this new NPS system impacts the likelihood of users returning to the app.
Completion Rate: The percentage of users who complete the survey and submit their NPS score.
User Sentiment: How the different scoring ranges affect the overall score and user behavior.
Hypothesis:
We hypothesize that making the NPS scale stricter by giving negative points to 1-6 scores will create more accurate feedback from users who are less satisfied, while the 9-10 scale will encourage promoters to reflect their genuine satisfaction.
This stricter NPS score might lower than the average score but will help identify promoters, detractors, and neutral users more clearly, allowing the team to improve customer experience based on clearer feedback.
What problem are we trying to solve?
Problem: Currently, NPS feedback might be too lenient, as users who give mid-range scores (7-8) are not classified as promoters or detractors. This can lead to inflated positive feedback that doesn’t reflect actual user satisfaction or loyalty.
Impact: By refining the scoring system, we aim to improve the accuracy of user feedback and Retain users who might otherwise be misclassified as neutral. With a clearer separation between promoters and detractors, we can better focus efforts on improving User Satisfaction and Retention for detractors.
Hypothesis: Assigning negative points for low scores (1-6) and positive points for high scores (9-10) will give a clearer picture of user sentiment, helping us to improve the app more effectively by addressing detractors.
Experiment:
We will set up an A/B test using Firebase's Remote Config to create two variations:
Variation A (Current NPS Scale): Keep the current scoring system where users rate from 1 to 10, but no points are assigned.
Variation B (Stricter NPS Scale): Apply the new point system where 1-6 scores receive -1 point, 7-8 receive 0 points, and 9-10 receive +1 point.
The audiences:
We will allocate 50% of users to Variation A (the current NPS rating system) and 50% to Variation B (the new point-based system).
Tracking Setup: We will track the following events using Firebase Analytics:
NPS Score Submitted: To see if users in either group are more likely to complete the NPS survey.
Retention: Measure if users who give higher NPS scores are more likely to return to the app.
Adoption and CTR: Track if users engage more frequently with the NPS rating when they understand their score more directly impacts the app experience.
Variations:
Variation A - Current NPS Rating (No Point System):
Users submit a rating from 1 to 10, but there is no point system applied. Promoters are classified based on scores of 9-10, detractors from 1-6, and neutral users at 7-8.
No points are assigned to any group.
Variation B - Point-based NPS System:
Scores are broken into three categories with a point-based system:
1-6 (-1 point): Detractors.
7-8 (0 points): Neutral.
9-10 (+1 point): Promoters.
The point-based system is shown to the user after submission (optional), and we analyze whether this impacts user engagement and retention.
Mockups and designs for the point-based variation can be created to visually show users their NPS impact on the app.
Next Steps:
Implement Firebase Remote Config: To toggle between the two variations and assign users to the appropriate groups.
Analyze Metrics: After the A/B test is complete, we will analyze the data and compare NPS scores, retention, adoption, and feedback quality between both variations.
Iterate: Based on results, we will implement the winning variation into the app and adjust the NPS survey system accordingly.
This approach helps refine your app's feedback system, making it more actionable and leading to a better understanding of user satisfaction.

