Metrics Collection:
NPS (Net Promoter Score)

How to collect: Collect NPS by adding a survey at the end of the Golden Path or key moments in the user flow. Use a Firebase Analytics custom event (e.g., nps_response) to log the score users provide (from 0 to 10). Store this score in Firebase with relevant user identifiers.
Adoption

How to collect: Track adoption through Firebase Analytics events like account_creation or feature_adoption. Log feature-specific custom events when users interact with new or core features of the app for the first time.
DAU (Daily Active Users)

How to collect: Firebase Analytics automatically tracks DAU by logging user sessions. Custom events like active_user can be triggered on app open to enhance reporting.
Retention

How to collect: Use Firebase’s built-in retention reporting, or track user_retention custom events with parameters that include the days since the user’s last visit (days_since_last_visit).
CTR for an Event on the Golden Path

How to collect: Use Firebase Analytics to track impressions and clicks on specific elements of the Golden Path. Log custom events such as event_impression and event_click, and then calculate the CTR by dividing the number of clicks by the number of impressions.
Number of 5-Star Reviews

How to collect: Add a custom event (e.g., star_rating) with a parameter for the score given. Log this event when users leave a review or rating, and filter for scores of 5 stars.
User Engagement Feedback

How to collect: Use Firebase Analytics to track time spent on the app and the number of interactions with specific features. For example, log the start and end time of user sessions and key feature interactions (e.g., feature_usage).
Download Rate

How to collect: Firebase Analytics automatically logs the number of users who download and install the app. Track first_open events to monitor downloads and onboarding flow.
Account Creation Rate

How to collect: Track the number of users who successfully create an account by logging a custom account_creation event with Firebase Analytics.
Active User Rate

How to collect: Use Firebase Analytics to track user activity. Log events like active_user and analyze the frequency of logins over 7, 14, and 28 days.
Playlist Push Rate
How to collect: Log custom events (e.g., playlist_push) every time a user successfully pushes a playlist. Store the count of total pushes in Firebase to analyze average usage per user.
Exit Rate
How to collect: Use Firebase Analytics to log app_exit events to track when users exit the app or abandon certain features. Analyze these exits to determine drop-off points in the Golden Path.
