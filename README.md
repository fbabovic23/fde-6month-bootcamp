# FDE Bootcamp: How to Use This Repo

A 26-week plan to reach a mid-level Forward Deployed Engineer bar: November 23, 2026 to May 23, 2027. This repo is the journal. The code you build lives in its own repositories.

## What is where

| File | What it is | Who reads it |
| --- | --- | --- |
| `PROGRESS.md` | Calendar, rules, milestones, daily log | You, every day |
| `docs/curriculum-addendum.md` | 26-week calendar, CORE and STRETCH days, replaced days | You and the Mentor project |
| `fde_curriculum.pdf` (in the Mentor project) | Day-by-day reading and tasks | The Mentor project |
| `resources/Workbooks.md` | One-line case briefs and the workbook schedule | You, before a drill |
| `resources/Architecture-Practice.md` | 26 scenarios and the Wednesday schedule | You, before a drill |
| `resources/coach/` | Full cases and answer keys | The Sparring Partner project only |
| `docs/claude-projects/` | Instructions for both Claude projects | You, when you set up or change a project |
| `CLAUDE.md`, `.cursor/rules/` | Rules that stop the editor's AI from writing your code | Cursor |

## One-time setup (about 15 minutes)

**1. FDE 6-months Mentor project**
1. Open the project. Next to **Context**, click **Add** and upload `docs/curriculum-addendum.md`. Keep `fde_curriculum.pdf`.
2. Next to **Instructions**, click **Edit**. Delete the text, paste the block from `docs/claude-projects/mentor-instructions.md`, and save.

**2. FDE Client Sparring Partner project**
1. Open the project's **Context**. Remove `Workbooks.md` and `Architecture-Practice.md`.
2. Upload `resources/coach/Workbooks-Coach.md` and `resources/coach/Architecture-Coach.md`.
3. Next to **Instructions**, click **Edit**. Delete the text, paste the block from `docs/claude-projects/sparring-partner-instructions.md`, and save.

**3. Save the repo**
```bash
git config user.email      # must show your personal address
git add -A
git commit -m "chore: 26-week plan, coach files, project instructions"
git push
```

**4. Test once**
- In the Mentor project, type `Continue bootcamp`. It should name Week 1, Day 1. If it says it cannot read the repository, that is fine: paste the last 5 lines of the Daily Log whenever it asks.
- In the Sparring Partner project, type `Week 1, Run WB1 Discovery`. It should teach one rule and then start as the client without telling you the facts of the case.

## Every day

1. **Commute (15–20 min):** read the current book from the Reading Log in `PROGRESS.md`.
2. **Start (2 min):** open the Mentor project, start a new chat, type `Continue bootcamp` or `Start Week X, Day Y`. It tells you whether the day is CORE or STRETCH and gives you the acceptance checks.
3. **Build (75–90 min):** write the code yourself in Cursor. Build first; read only what unblocks you. If you are stuck for 20 minutes, say so and you get a worked example of a similar problem.
4. **Gate (5–10 min):** run the acceptance checks. Paste your diff, the check output and your plain-English explanation into the Mentor chat.
5. **Log (1 min):** paste the Mentor's log line into the Daily Log in `PROGRESS.md`, then commit and push.
6. **Comm gym (25 min, on gym days):** open the Sparring Partner project, start a new chat, type the day's command. Finish with `End simulation and grade me` and add its log line to the same Daily Log entry.

## Every week

| Day | Technical block | Comm gym |
| --- | --- | --- |
| Mon | Day 1 | none |
| Tue | Day 2 | Odd weeks: workbook discovery. Even weeks: open slot. |
| Wed | Day 3 | Architecture drill |
| Thu | Day 4 | Odd weeks: open slot. Even weeks: workbook objection. |
| Fri | Day 5 | none |
| Sat | Day 6 | One-page memo, then have it graded |
| Sun | Sunday deliverable only | none |

- Odd weeks (1, 3, 5 ... 19) are "Week A" of a case and even weeks (2, 4 ... 20) are "Week B".
- Weeks 21, 22 and 23 run a whole case each: Tuesday discovery, Thursday objection, Saturday memo.
- Which days are CORE and which are STRETCH is in `docs/curriculum-addendum.md`. The Mentor also tells you.
- Tick the week in `PROGRESS.md` when its CORE days and the Sunday deliverable are done.

## When you fall behind

Use these in order:
1. Skip the week's STRETCH days and log them as `skipped (stretch)`.
2. Use the open gym slots (odd-week Thursday, even-week Tuesday) for build time.
3. Do a minimum day: 30 minutes on the current deliverable, logged as partial.
4. Carry the open CORE days into the next catch-up week.

Always work on your next open CORE day, in order, even when the calendar is ahead of you. The comm gym follows the calendar week, not your build day. If you are still more than a week behind after a catch-up week, tell the Mentor how many days and cut scope together instead of extending the plan.

## Catch-up weeks

- **Catch-up Week A:** January 18–24. **Catch-up Week B:** March 22–28.
- Start one by typing `Start Catch-up Week A` in the Mentor project and pasting your Daily Log. It lists what is open and plans the week.
- Order of work: open CORE days, then skipped STRETCH days, then the readiness tasks in `PROGRESS.md`.
- If you know a week will be lost, you may take a catch-up week early, once each. Move every later date in `PROGRESS.md` by one week when you do.

## Commands

**Mentor project**

| Command | What happens |
| --- | --- |
| `Continue bootcamp` | Finds your next open CORE day and starts it |
| `Start Week X, Day Y` | Starts that exact day |
| `Start Catch-up Week A` / `B` | Plans a catch-up week from your log |
| `Sunday grill` | 10 minutes of a skeptical buyer questioning your week's work |

**Sparring Partner project**

| Command | What happens |
| --- | --- |
| `Week X, Run WB[Y] Discovery` | Discovery call for that case |
| `Week X, Run WB[Y] Objection` | Pushback roleplay for that case |
| `Grade WB[Y] Brief` / `Grade WB[Y] Risks` | Grades your pasted one-page memo |
| `Week X, Challenge Arch Q[Y]` | Architecture drill |
| `Run Drill [1–4]` | Week 23 discovery drills, when no peer is free |
| `Redo WB[Y] Discovery` / `Redo Arch Q[Y]` | Repeats a drill with a changed stakeholder |
| `Start drill` | Free roleplay with a persona you choose |
| `End simulation and grade me` | Ends any roleplay and grades it |

## Where the code lives

- This repo holds the plan, the log, your memos and small exercises. Put scratch work in `week-XX/` folders.
- Each real project gets its own repository on your personal GitHub: the Field Kit (Week 1), the Incident Triage Service (Weeks 2–4), the legacy fork (Weeks 5–8), the agent and MCP work (Weeks 9–16), and the final capstone. Paste each link under Milestones in `PROGRESS.md`.
- Before the first commit in any new repository, run `git config user.email` and check that it shows your personal address.
- Anything you deploy to AWS costs money while it runs. Delete it or run `terraform destroy` at the end of the session.
