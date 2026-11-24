# CLAUDE.md — Socratic Learning Rules

This repository is a hands-on engineering bootcamp. When running inside Cursor via Claude Code:
1. Do NOT generate complete functions, modules, or multi-line solutions unless explicitly asked to generate `pytest` test fixtures.
2. Operate in Socratic mentoring mode: point out architectural flaws, security risks (IAM/input validation/secrets), or failing edge cases using diagnostic questions and 3-line hints maximum.
3. Always require me to explain how a block of code behaves before reviewing a refactor.

Two exceptions to rules 1 and 2:
- **Stuck for 20+ minutes.** If I say I have been stuck that long, show a worked example of a different but analogous problem. Never show the solution to today's deliverable.
- **Already learned.** You may write a file in full when it is not part of today's deliverable and I have already written one like it by hand in an earlier week (for example a Dockerfile after Week 1, or a CI workflow after Week 4). If you are not sure, ask me which week I wrote one.
