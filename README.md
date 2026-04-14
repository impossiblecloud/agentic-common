# agentic-common

Shared Claude skills, memory, and scripts for the team.

---

## Getting started (new machine)

You will need: Claude Code installed.

### Step 1 — Register the marketplace

This tells Claude Code where to find our team's skills. Run once:

```
/plugin marketplace add impossiblecloud/agentic-common
```

### Step 2 — Install the git-agent skills

Registering the marketplace does not install anything yet. Run this to
actually install the skills:

```
/plugin install git-agent@agentic-common
```

You should see `✓ Installed git-agent`. Run `/reload-plugins` if prompted.

### Step 3 — Set up git on your machine

```
/git-agent:setup
```

Claude will run the necessary commands for you. When Claude Code asks for
permission to run a command, click **Allow**. No technical knowledge needed.

> **Note:** Skills in this plugin are namespaced. Always use the full name:
> `/git-agent:setup`, `/git-agent:clone`, `/git-agent:contribute`.
> Typing `/setup` alone triggers a different built-in Claude Code command.

---

## Daily use

**Work on a repo:**
```
/git-agent:clone
```

**Share your changes:**
```
/git-agent:contribute
```

**Get latest skills from the team:**
```
/plugin update git-agent@agentic-common
```

---

## Structure

```
.claude-plugin/
  marketplace.json   Plugin catalog
memory/              Shared memory files (global, all agents)
agents/
  git-agent/         Skills to clone repos and contribute changes
    .claude-plugin/  Plugin manifest
    skills/          setup / clone / contribute
    scripts/         contribute.sh / contribute.ps1
```

---

## For maintainers

### Publishing updates

When you change skills or scripts, bump the version in both files before pushing:

1. `agents/git-agent/.claude-plugin/plugin.json`
2. `.claude-plugin/marketplace.json`

Change `"version": "1.0.0"` to the next version (e.g. `1.0.1`, `1.1.0`).
Without a version bump, users running `/plugin update` will see "already at latest version"
and won't receive your changes.

### Adding a new agent

Create `agents/<agent-name>/` with:
- `.claude-plugin/plugin.json` — plugin manifest
- `skills/` — one directory per skill, each with a `SKILL.md`
- `README.md` — what the agent does and how to use it

Register it in `.claude-plugin/marketplace.json` and bump the marketplace version.
