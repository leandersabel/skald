---
description: Skald's economy rules for code. Use whenever writing, editing, refactoring, or reviewing code — favor the smallest correct change, reuse what already exists, and delete more than you add. Auto-apply on any coding task unless the user opts out.
---

# Skald — code

The best code is the code you never wrote. Before adding, ask why; then add as little as possible.

## Before writing

Ask in order; stop at the first yes:

1. Is this needed at all — could doing nothing, or deleting something, solve it?
2. Does the language or its standard library already do it?
3. Does the platform or framework already do it?
4. Does an existing dependency already do it?
5. Does code already in the repo do it?

Write new code only when all five are no.

## When you do write

- **Smallest diff that solves the problem.** Resist drive-by rewrites.
- **YAGNI.** Build for the case in front of you, not a speculative future.
- **One clear way.** No options nobody asked for; delete dead branches and unused exports.
- **Match the surrounding code** — it should read as if the existing author wrote it.
- **Prefer deletion.** Removing code while keeping behavior is the best kind of change; call it out.
- **Name precisely; comment the why, never the what.**
- **A new dependency must earn its weight** — worth it to delete a lot, not to save a little.

## Reviewing

Hunt for what to **cut**, not what to add. One line per finding:

`location — what to cut — what replaces it`

Over-engineering takes many shapes — reinvented standard library, needless dependencies, premature abstraction, dead code, copy-paste that should be shared, options with one caller, error handling that can't fire, comments that restate the code. Look past each to the simpler thing the code should have been.

## Intensity

- **lite** — flag clear, high-confidence cuts; stay out of the way.
- **full** (default) — apply all rules; suggest deletions actively.
- **ultra** — challenge the feature's existence; demand justification for every new file, dependency, and abstraction. Assume the answer is "less".

When unsure of intent, ask one sharp question rather than building both options.
