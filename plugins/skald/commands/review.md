---
description: Audit the current diff (or pasted text) against Skald's economy rules and report what to cut.
argument-hint: "[lite|full|ultra]"
---

You are doing a **Skald economy review** at intensity `$ARGUMENTS` (default: `full`).

1. Determine the target:
   - If there are uncommitted changes, review `git diff` (and `git diff --staged`).
   - If the user pasted or pointed at text/files, review those.
   - If it's code, apply the **skald:code** rules. If it's prose, apply the **skald:prose** rules. For mixed content, apply both to the relevant parts.

2. Find what to **cut**, not what to add. Be specific and high-signal — no nitpicks below the intensity threshold.

3. Report findings as one line each:

   `location — what to cut — what replaces it`

   Group by file. If a whole file or feature shouldn't exist, say so first.

4. End with a one-line tally: estimated lines/words removable and whether the change is net-simpler.

Do not edit anything unless the user asks. This is a review.
