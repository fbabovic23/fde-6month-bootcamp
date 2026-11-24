# Architecture Practice: 26 AWS & FDE Scenarios

This file has the scenarios only. The answer key is in `resources/coach/Architecture-Coach.md`, which
lives in the FDE Client Sparring Partner project. Look at an answer only after the drill for that question.

## How to run the Wednesday drill
- **Questions 1–11 (warm-ups, about 5 minutes each):** Sketch the services in 2 minutes, paste the sketch
  into `FDE Client Sparring Partner` with `Week [X], Challenge Arch Q[Y]`, then repeat for the next question.
  Finish with a 3-minute voice memo on the one you found hardest.
- **Questions 12–26 (25-minute deep dive):**
  1. Draft on paper (10 min): the services, plus one sentence each for reliability, security, cost and performance.
  2. Record your own 3-minute CFO voice translation (5 min). Do this before the challenge, so the words are yours.
  3. Run `Week [X], Challenge Arch Q[Y]` and paste both the design and a short summary of your translation (10 min).

## Schedule
Week numbers are curriculum weeks 1–24, as in `PROGRESS.md`. The two catch-up weeks have no scheduled drill. 26 scenarios do not fit one per Wednesday in 24 weeks, so the warm-ups are grouped.

| Week | Wednesday drill |
| --- | --- |
| 1 | Q1, Q2, Q3 (warm-ups) |
| 2 | Q4, Q5, Q6 (warm-ups) |
| 3 | Q7, Q8, Q9 (warm-ups) |
| 4 | Q10, Q11 (warm-ups) |
| 5–18 | One deep dive a week, Q12 to Q25. Week N runs Q(N+7): Week 5 is Q12, Week 18 is Q25. |
| 19–21 | Redo your three weakest deep dives without notes, or use the slot to catch up. |
| 22 | Q26, the final scenario. It lands in the cloud deployment week of the curriculum. |
| 23–24 | No drill. Week 23 has its own discovery drills and Week 24 is the final capstone. |

## Scenarios

| Q# | Scenario |
| --- | --- |
| 1 | A marketing team needs a static website for global users, with HTTPS and the lowest possible cost. |
| 2 | A web app runs on one EC2 instance and goes down whenever the instance fails. Make it highly available. |
| 3 | A relational database must survive an AZ failure with minimal downtime. |
| 4 | A read-heavy product catalog has database CPU at 90%. |
| 5 | Users upload images and need thumbnails generated automatically. |
| 6 | Orders must never be lost during traffic spikes. |
| 7 | EC2 in a private subnet must download updates but stay unreachable from the internet. |
| 8 | An app needs S3 access with no credentials on servers and no traffic over the internet. |
| 9 | Database passwords must be stored securely and rotated automatically. |
| 10 | Audit logs must be kept 7 years, are rarely read, and must be cheap and tamper-proof. |
| 11 | A mobile app's API has unpredictable traffic, from zero to thousands of requests a second. |
| 12 | A company's data center needs a private, consistent connection to AWS. |
| 13 | A SaaS product must isolate each customer's data. |
| 14 | A customer requires all their data to stay in the EU. |
| 15 | A webhook receiver gets bursts of 10,000 events a minute and must never process one twice. |
| 16 | A company wants near-real-time clickstream analytics. |
| 17 | A regional outage must be survivable with RTO 1 hour and RPO 15 minutes. |
| 18 | The monthly AWS bill doubled. Find and cut the cost. |
| 19 | A nightly 3-hour batch job can tolerate interruptions. |
| 20 | A small team must pick between ECS, EKS and Fargate for a containerized app. |
| 21 | Users in Asia complain about slow responses from an app in us-east-1. |
| 22 | A company with 20 AWS accounts needs central control and guardrails. |
| 23 | An AWS access key was leaked publicly on GitHub. |
| 24 | A regulated customer wants LLM-powered Q&A over its own documents, with no data leaving its control. |
| 25 | An on-premises PostgreSQL database must move to AWS with minimal downtime. |
| 26 | Final: design an AI hiring platform that must handle 10x growth over a year. |
