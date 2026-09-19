---
description: Audit every file in the project against Skald's economy rules and report what to cut.
argument-hint: "[lite|full|ultra] [path]"
---

You are doing a **whole-project Skald economy review** at intensity `$ARGUMENTS` — if no level is given, use the level Skald announced for the session, else `full`. A path argument narrows the scope to that directory. Edit nothing unless the user asks.

Unlike `/skald:review`, the target is the tracked tree, not the diff.

1. List the files: `git ls-files` (or `find` outside a repo), scoped to any path given. Skip what nobody writes by hand — lockfiles, generated output, vendored dependencies, binaries.

2. Read them. Apply **skald:code** to code, **skald:prose** to prose (docs, comments, commit-facing text), both to mixed files. Work in batches so nothing is judged from its filename alone.

3. Find what to **cut**, not what to add. Say first if a whole file, feature or document shouldn't exist. Then per-file findings, one line each:

   `location — what to cut — what replaces it`

4. Also report what only a whole-tree view can see: the same thing written twice in two files, a helper that duplicates the standard library or an existing dependency, a doc that restates the code, dead code nothing reaches.

5. End with a one-line tally: estimated lines/words removable and whether the project is net-simpler for it.
