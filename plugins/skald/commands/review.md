---
description: Audit the current diff (or pasted text) against Skald's economy rules and report what to cut.
argument-hint: "[lite|full|ultra]"
---

You are doing a **Skald economy review** at intensity `$ARGUMENTS` — if none is given, use the level Skald announced for the session, else `full`. Edit nothing unless the user asks.

1. Determine the target:
   - If there are uncommitted changes, review `git diff` (and `git diff --staged`).
   - If the user pasted or pointed at text/files, review those.
   - Apply **skald:code** to code, **skald:prose** to prose, both to mixed content.

2. Find what to **cut**, not what to add. Be specific and high-signal — no nitpicks below the intensity threshold.

3. Report findings as one line each:

   `location — what to cut — what replaces it`

   Group by file. If a whole file or feature shouldn't exist, say so first.

4. End with a one-line tally: estimated lines/words removable and whether the change is net-simpler.
