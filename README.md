# Skald

> Economy of expression for code and prose — say more with less.

A Claude Code plugin. Named for the Old Norse court poets who compressed sagas into a few dense words. Skald pushes Claude toward the **smallest correct change** in code and the **tightest writing** in prose.

| Component | Invoke | What it does |
| --- | --- | --- |
| `skald:code` | auto on coding tasks, or `/skald:code` | Smallest correct change; reuse over rewrite; delete more than you add. |
| `skald:prose` | auto on writing tasks, or `/skald:prose` | Answer first; cut filler; one idea per sentence. |
| `/skald:review` | `/skald:review [lite\|full\|ultra]` | Audit the current diff or pasted text and report what to cut. |
| baseline hook | every session | Applies the rules by default at level `full`. |

Each skill runs at three intensities — `lite`, `full` (default), `ultra`.

## Install

The repo is its own marketplace, so install straight from it:

```
/plugin marketplace add https://github.com/leandersabel/skald.git
/plugin install skald@skald
```

Update later with `/plugin marketplace update skald`.

## Local development

Test without installing, then `/reload-plugins` after edits:

```
claude --plugin-dir ./plugins/skald
```

Validate before committing:

```
claude plugin validate ./plugins/skald
```

## Layout

```
skald/
├── .claude-plugin/
│   └── marketplace.json        # this repo is the marketplace
└── plugins/skald/
    ├── .claude-plugin/plugin.json
    ├── skills/{code,prose}/SKILL.md
    ├── commands/review.md
    └── hooks/                  # always-on baseline
```

## Extending

- Add a rule pack: a new folder `plugins/skald/skills/<name>/SKILL.md`.
- Change the always-on level: edit `SKALD_LEVEL` in `plugins/skald/hooks/baseline.sh`.
- Bump `version` in `plugin.json` so `/plugin marketplace update` picks up changes.
