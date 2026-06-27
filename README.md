# Skald

> Economy of expression for code and prose — say more with less.

A private Claude Code plugin. Named for the Old Norse court poets who compressed
whole sagas into a few dense words. Skald pushes Claude toward the **smallest
correct change** in code and the **tightest writing** in prose.

It ships two model-invoked skills and one review command:

| Component | Invoke | What it does |
| --- | --- | --- |
| `skald:code` (skill) | auto on coding tasks, or `/skald:code` | Smallest correct change; reuse over rewrite; delete more than you add. |
| `skald:prose` (skill) | auto on writing tasks, or `/skald:prose` | Answer first; cut filler; one idea per sentence. |
| `/skald:review` (command) | `/skald:review [lite\|full\|ultra]` | Audit the current diff or pasted text and report what to cut. |

Each skill supports three intensities — `lite`, `full` (default), `ultra`.

## Install (private)

This is a normal git repo acting as its own marketplace. Nothing is published to
any public Claude plugin list — installs come straight from the repo.

On each machine / account:

```
/plugin marketplace add git@github.com:<you>/skald.git
/plugin install skald@skald
```

Private repos work over your existing git/SSH auth. To update later:

```
/plugin marketplace update skald
```

### Local development

Test changes without installing:

```
claude --plugin-dir ./plugins/skald
```

Then `/reload-plugins` after edits. Validate the manifest before committing:

```
claude plugin validate ./plugins/skald
```

## Layout

```
skald/
├── .claude-plugin/
│   └── marketplace.json        # this repo is the marketplace
└── plugins/
    └── skald/
        ├── .claude-plugin/
        │   └── plugin.json     # the plugin manifest
        ├── skills/
        │   ├── code/SKILL.md
        │   └── prose/SKILL.md
        └── commands/
            └── review.md
```

## Extending

- Add a rule pack: new folder under `plugins/skald/skills/<name>/SKILL.md`.
- Make a rule **always-on** instead of model-invoked: add a `SessionStart` hook
  in `plugins/skald/hooks/hooks.json` that injects the baseline.
- Bump `version` in `plugin.json` so installs pick up changes on
  `/plugin marketplace update`.
