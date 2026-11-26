# 26-Week FDE & Cloud/AI Security Bootcamp Log

**Start:** Monday, November 23, 2026 · **End:** Sunday, May 23, 2027
**Daily Target:** 75–90m Technical Build + 25m Executive Communication Gym
**Plan files:** `fde_curriculum.pdf` (daily tasks) + `docs/curriculum-addendum.md` (calendar, CORE and STRETCH days, replaced days). The addendum wins where they differ.
**How to use all of this:** `README.md`

## Rules
- **Build first.** Start with the day's hands-on deliverable. Read only what unblocks it.
- **CORE before STRETCH.** Finish CORE days in order. Skip STRETCH days when behind and log them as `skipped (stretch)`.
- **Done means checked.** A day is complete when a check that could have failed has passed (a test run, a command's output, a CI status) and the Feynman Gate is passed.
- **Minimum day.** On a bad day, 30 minutes on the current deliverable keeps the chain. Log it as a partial day and finish it next session.
- **Sunday is light.** Only the Sunday deliverable.
- **Catch-up weeks are for catching up.** Open CORE days first, then skipped STRETCH days, then the readiness tasks below. No new curriculum.
- **Coach files stay closed.** `resources/coach/` holds the answer keys. Open a case there only after it has been graded.

## Weekly Checkpoints
Week numbers are curriculum weeks, the same as in the PDF.

### Phase 1: Software Rigor, Testing & Legacy Exploration
- [ ] **Week 01 (Nov 23):** CLI Fluency, Git Internals & Reproducible Containers | Sun: 400-word Field Kit README [ ]
- [ ] **Week 02 (Nov 30):** Typed Backend APIs & Data Contracts | Sun: 3-min walkthrough recorded [ ]
- [ ] **Week 03 (Dec 07):** Automated Testing Foundations & TDD Discipline | Sun: 1-page testing checklist [ ]
- [ ] **Week 04 (Dec 14):** Continuous Integration, Contracts & API Resilience + first AWS deploy | Sun: 500-word engineering note [ ]
- [ ] **Week 05 (Dec 21):** Navigating & Understanding Legacy Codebases | Sun: 1-page legacy onboarding playbook [ ]
- [ ] **Week 06 (Dec 28):** Characterization Testing & Locking in Behavior | Sun: 3-min demo recorded [ ]
- [ ] **Week 07 (Jan 04):** Disciplined Refactoring Mechanics | Sun: note on cognitive load and token count [ ]
- [ ] **Week 08 (Jan 11):** Phase 1 Capstone — Legacy Stabilization & Refactoring | Sun: 5-min walkthrough + 500-word memo [ ]
- [ ] **Catch-up Week A (Jan 18):** open CORE days, skipped STRETCH days, readiness tasks

### Phase 2: Applied AI, Agents & Harness Engineering
- [ ] **Week 09 (Jan 25):** LLM Foundations, Structured Outputs & Prompt Reliability | Sun: short technical note [ ]
- [ ] **Week 10 (Feb 01):** Core Agentic Patterns — Reflection & Tool Use | Sun: 3-min demo recorded [ ]
- [ ] **Week 11 (Feb 08):** Planning, Routing & Retrieval (RAG) Build | Sun: 500-word architecture note [ ]
- [ ] **Week 12 (Feb 15):** Model Context Protocol (MCP) Architecture & Servers | Sun: 3-min demo recorded [ ]
- [ ] **Week 13 (Feb 22):** Enterprise Database & CRM Integration via MCP | Sun: 1-page security & integration brief [ ]
- [ ] **Week 14 (Mar 01):** Harness Engineering, ADRs & Domain Constraints | Sun: 3-min demo recorded [ ]
- [ ] **Week 15 (Mar 08):** "Tests as Data" — Tabular Acceptance Suites for Agents | Sun: 500-word guide [ ]
- [ ] **Week 16 (Mar 15):** Phase 2 Capstone — 48-Hour Enterprise Integration Prototype | Sun: 5-min live demo recorded [ ]
- [ ] **Catch-up Week B (Mar 22):** open CORE days, skipped STRETCH days, readiness tasks

### Phase 3: Deployment, Evals & Field Operations
- [ ] **Week 17 (Mar 29):** Agent Observability & OpenTelemetry Tracing | Sun: 1-page observability standard [ ]
- [ ] **Week 18 (Apr 05):** Automated Evaluation Pipelines & LLM-as-a-Judge | Sun: 3-min demo recorded [ ]
- [ ] **Week 19 (Apr 12):** Latency, Token Economics & Architecture Optimization | Sun: 500-word CFO cost brief [ ]
- [ ] **Week 20 (Apr 19):** LLM Security & OWASP Top 10 Mitigations | Sun: 1-page security posture summary [ ]
- [ ] **Week 21 (Apr 26):** Enterprise Identity, RBAC & Data Zoning | Sun: 3-min demo recorded [ ]
- [ ] **Week 22 (May 03):** Cloud Container Deployment & Infrastructure as Code (AWS) | Sun: 500-word deployment summary + runbook [ ]
- [ ] **Week 23 (May 10):** Customer Discovery, Thin-Slice Scoping & ADR Drills | Sun: Week 24 scope locked [ ]
- [ ] **Week 24 (May 17):** Final FDE Capstone — End-to-End Field Engagement | Sun: 5-min executive & technical demo [ ]

## Communication Reading Log (15–20 min/day on commute)
- [ ] **Weeks 1–4 (Nov 23 – Dec 20):** *Smart Brevity* & *The Mom Test*
- [ ] **Weeks 5–8 (Dec 21 – Jan 17):** *The Pyramid Principle*
- [ ] **Weeks 9–12 (Jan 25 – Feb 21):** *The Software Architect Elevator*
- [ ] **Weeks 13–16 (Feb 22 – Mar 21):** *Great Demo!*
- [ ] **Weeks 17–20 (Mar 29 – Apr 25):** *Never Split the Difference*
- [ ] **Weeks 21–24 (Apr 26 – May 23):** No new reading

In a catch-up week, finish the current book.

## Communication Gym Schedule
- **Workbooks (Tue / Thu / Sat):** WB1–WB10 in two-week blocks over Weeks 1–20, then WB11, WB12, WB13 as one-week loops in Weeks 21, 22, 23. Full table in `resources/Workbooks.md`.
- **Architecture (Wed):** Q1–Q11 warm-ups in Weeks 1–4, Q12–Q25 deep dives in Weeks 5–18, Q26 in Week 22. Full table in `resources/Architecture-Practice.md`.
- **Catch-up weeks:** no scheduled drill. Repeat one drill you did badly if you want.

## Milestones

### Proof of work
Each project lives in its own repository. Paste the link when it exists.
- [ ] **Week 01:** FDE Field Kit repository —
- [ ] **Week 04:** Incident Triage Service tagged `v1.0.0`, passing CI, deployed once to AWS —
- [ ] **Week 08:** Phase 1 capstone that a reviewer can clone and run with `make test` —
- [ ] **Week 11:** Retrieval service with a 20-question eval set —
- [ ] **Week 16:** Phase 2 capstone (invoice and purchase order reconciliation agent) —
- [ ] **Week 24:** Final capstone on a live AWS URL, with evals, ROI memo and 5-min demo —

### Readiness tasks
- [ ] **Catch-up Week A:** Phase 1 capstone is public with a README a stranger can follow
- [ ] **Catch-up Week A:** CV and profile list the capstone in one line with its link
- [ ] **Catch-up Week A:** one engineer (not an AI) has reviewed the capstone
- [ ] **Catch-up Week A:** the peer and the experienced engineer for Week 23 have said yes
- [ ] **Catch-up Week B:** Phase 2 capstone is public with its 5-min demo
- [ ] **Catch-up Week B:** one live mock discovery call with a person
- [ ] **Catch-up Week B:** if you are looking for a new role, first applications sent (hiring takes weeks, so do not wait for Week 24)
- [ ] **Weeks 21–23:** two mock interviews with people: one walkthrough of a capstone, one client scenario
- [ ] **Week 23 (in the PDF):** a peer plays the VP of Logistics on Monday; an experienced engineer reviews the four discovery artifacts on Saturday

## Daily Log
Format: `- **date (WxxDyy):** what I built · check that passed · gym: drill, hits/misses`

- **2026-11-23:** Setup day: repo, tracker, Cursor rules, both Claude projects. W01D01 moves to Nov 24.
- 2026-11-24 | W01D01 | http_errors.sh: POSIX sh HTTP error-rate summary + fixtures | all 7 checks pass (shellcheck, sh/dash diff, empty, missing file → exit 2) | c1ad481 | 2 sessions
- 2026-11-24 | W01D02 | skipped (stretch)