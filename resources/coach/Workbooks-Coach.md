# Industry Consulting Workbooks — Coach File (13 Cases)

**Coach-only.** This file holds the full situation, the objection and the grading rubric for every case.
Upload it to the FDE Client Sparring Partner project. Do not open it before a drill: your own file is
`resources/Workbooks.md`, which has the one-line briefs and the schedule. Read a case here only after its
last memo has been graded.

## Workbooks 1–7

### WB1 · Healthcare: clinic no-shows
**Situation:** A chain of 12 dental clinics has a 22% appointment no-show rate. Three months ago they bought an AI tool that sends SMS reminders, and no-shows haven't moved. The operations director wants answers.
**Objection:** "Your tool doesn't work. We want to cancel."
**Good looks like:**
- You check whether reminders were actually sent and received before blaming the product.
- You separate an adoption problem from a product problem.
- Your success metric is no-show rate per clinic, not "messages sent."

### WB2 · Logistics: wrong delivery ETAs
**Situation:** A courier with 400 drivers uses an ETA prediction tool. Customers complain that ETAs are off by 45 minutes or more, and support tickets have doubled. The tool combines driver GPS with a traffic API.
**Objection:** "Our drivers say the app is the problem, not the routes."
**Good looks like:**
- You list at least 3 hypotheses (GPS gaps, stale traffic data, driver behavior) and how to test each.
- You measure the error before proposing any fix.
- You talk to drivers, not just managers.

### WB3 · Banking: fraud alert overload
**Situation:** A regional bank's fraud system flags 3,000 transactions a day. Analysts can review 800, and 95% of the flags turn out to be false positives. Real fraud is slipping through in the backlog.
**Objection:** "We can't lower sensitivity. The regulator will come after us."
**Good looks like:**
- You explain the precision vs recall trade-off in plain words.
- You propose triage by risk tier instead of simply lowering sensitivity.
- You bring compliance into the decision rather than deciding for them.

### WB4 · Retail: search that doesn't sell
**Situation:** An online fashion retailer has 50,000 products. 30% of searches end with no click, and conversion has dropped 8% this year. They're evaluating your AI search against a competitor.
**Objection:** "Your competitor promises a 20% conversion lift in two weeks."
**Good looks like:**
- You set a baseline before promising any lift.
- You propose an A/B test with a clear success metric.
- Your demo opens with the customer's outcome, not a feature tour.

### WB5 · Manufacturing: dashboards go dark at night
**Situation:** A factory streams data from 2,000 sensors into your monitoring platform. Every night around 2 a.m., the dashboards go blank for about 40 minutes. The plant manager blames your platform, because night shift can't see machine temperatures.
**Objection:** "We need a guarantee this never happens again."
**Good looks like:**
- You find the cause from evidence, not guesses.
- You separate the trigger from the root cause.
- You offer an SLO and monitoring instead of an impossible guarantee.

### WB6 · Energy: chatbot gives wrong tariffs
**Situation:** A utility with 1 million customers runs a support chatbot over its policy documents. About 1 in 6 answers about tariffs is wrong, and a customer has complained to the regulator.
**Objection:** "Just make it never be wrong."
**Good looks like:**
- You find the real failure mode (outdated documents, bad chunking or missing citations).
- You propose an eval set, cited sources and a handoff to a human for low-confidence answers.
- You explain honestly why zero errors isn't realistic, and what the safe alternative is.

### WB7 · Insurance: claims intake pilot
**Situation:** An insurer wants your AI to read claim PDFs and push the extracted data into its 15-year-old claims system through an API. They're offering a 6-week pilot, but their IT security team is skeptical.
**Objection:** "Our IT team says your API isn't secure enough."
**Good looks like:**
- You map the stakeholders: sponsor, IT security, claims team, procurement.
- You answer security concerns specifically (SSO, encryption, data residency, audit logs).
- Your pilot has measurable success criteria agreed before it starts.

## Workbooks 8–13

### WB8 · Public sector: permit backlog
**Situation:** A city has a backlog of 9,000 building permit applications, and the average wait is 70 days. They want AI to sort and pre-check applications. The data is messy: scanned forms, three old systems and inconsistent addresses. All data must stay on city servers.
**Objection:** "Data cannot leave our servers. Ever."
**Good looks like:**
- You offer deployment options (on-premises, private cloud) with honest trade-offs.
- You fix data quality before adding AI.
- You plan for the clerks: training, and keeping humans in charge of final decisions.

### WB9 · Telecom: the churn model nobody uses
**Situation:** A mobile operator built a churn prediction model that is about 80% accurate. Six months later, the retention team still ignores it, and churn is unchanged at 2.1% a month.
**Objection:** "The retention team doesn't trust a black box."
**Good looks like:**
- You treat this as an adoption and workflow problem, not a model problem.
- You show why each customer was flagged, in plain words.
- Your ROI model uses the customer's own numbers and states its assumptions.

### WB10 · Airline: slow when it matters most
**Situation:** An airline's crew scheduling app loads in 2 seconds on normal days. During storms, when hundreds of flights are rescheduled, load times reach 2 minutes and traffic spikes 10x. Disruptions cost the airline about €400,000 per bad day.
**Objection:** "Why wasn't it built for this from the start?"
**Good looks like:**
- You quantify the load and use p95/p99 latency, not averages.
- You answer the objection honestly without blaming anyone.
- You phase the fix: quick wins this week, deeper changes next quarter.

### WB11 · Pharma: clinical documents under scrutiny
**Situation:** A pharma company wants your AI to draft sections of clinical trial reports. Before any pilot, you must pass a 60-question security and compliance review (GDPR, EU data residency, audit logs). You also have to prove the AI is accurate on medical terminology.
**Objection:** "How do we know it won't hallucinate in a regulatory submission?"
**Good looks like:**
- Every AI draft is reviewed by a human expert, with an audit trail.
- Your eval plan has a threshold that must be met before going live.
- Your security answers are specific; where you can't do something, you say so.

### WB12 · Legal: an agent in a law firm
**Situation:** A 200-lawyer firm is piloting a contract review agent. Partners are skeptical, associates already use it informally, and IT worries about client data leaks. One contract contained hidden text that tried to instruct the AI.
**Objection:** "If it misses one clause, we're liable."
**Good looks like:**
- You scope the agent narrowly: it flags issues and drafts, and lawyers decide.
- You treat prompt injection seriously and explain it in plain words.
- You turn informal use into a governed rollout instead of banning it.

### WB13 · Media: "make recommendations better"
**Situation:** A streaming service with 5 million users says, "We want better recommendations." That's the whole brief. This is your final case: run the full FDE loop, like a complete interview.
**Objection:** "We could build this ourselves."
**Good looks like:**
- You turn "better" into a measurable goal within the first 10 minutes.
- You give a fair build-vs-buy comparison, including cost and time to value.
- Your phased plan has a pilot, a metric and a decision point.
