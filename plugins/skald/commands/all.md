---
description: Apply Skald's economy rules to every file in the project, cutting what does not earn its place.
argument-hint: "[lite|full|ultra] [path]"
---

A whole-project Skald pass at intensity `$ARGUMENTS`. If no level is given, use the level Skald announced for the session, else `full`. A path argument narrows the scope to that directory.

This is **skald:code** and **skald:prose** applied to the tracked tree rather than to one task, and it edits. `/skald:review` is the report-only command.

1. List the files with `git ls-files`, or `find` outside a repo, scoped to any path given. Skip what nobody writes by hand: lockfiles, generated output, vendored dependencies, binaries.

2. Read them in batches, so nothing is judged from its filename alone. Apply **skald:code** to code, **skald:prose** to prose (docs, comments, commit-facing text), both to mixed files.

3. Make the cuts. Smallest edit that lands the rule, and behavior stays as it is: this is a pass for economy, not a refactor or a bug hunt. A fault you find on the way is reported, not fixed here.

4. Cut across files too, which is what this command sees and `/skald:review` cannot: the same thing written twice, a helper the standard library or an existing dependency already provides, a doc restating the code, dead code nothing reaches. Where one fact has two homes, keep the better one and leave a pointer.

5. Ask before deleting a whole file, feature, or document, naming what goes with it. Ask before any cut that turns on intent the tree does not state.

6. Run the project's tests, if it has them.

7. Report what changed, grouped by file, one line each:

   `location: what went, what took its place`

   End with a one-line tally: lines and words removed, and whether the project is net-simpler for it. Name what you left alone and why.
