#!/bin/sh
# Skald always-on baseline. Whatever this prints is added to the session context.
# Set SKALD_LEVEL=lite|full|ultra in the environment to retune, or change the default here.
SKALD_LEVEL="${SKALD_LEVEL:-full}"
SKILLS="$(cd "$(dirname "$0")/../skills" && pwd)"

# The one-line rule digest under a skill's "## Baseline" heading. Edit it there.
digest() {
	awk '/^## Baseline$/ { while (getline && $0 == "") ; print; exit }' "$SKILLS/$1/SKILL.md"
}

cat <<EOF
Skald is active at level **${SKALD_LEVEL}**. Apply economy by default to everything you produce this session, without being asked:

- Code: $(digest code) (Full rules: the skald:code skill.)
- Prose: $(digest prose) (Full rules: the skald:prose skill.)

At level lite, only the clearest wins; at ultra, be ruthless and challenge whether the code/feature/sentence should exist at all. This level governs the skald skills and /skald:review unless an invocation names another. Do not mention Skald in your output unless it is relevant.
EOF
