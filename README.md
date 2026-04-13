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

Claude will guide you through the rest. No technical knowledge needed.

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

## Adding a new agent

Create `agents/<agent-name>/` with a `.claude-plugin/plugin.json`, a `skills/`
dir, and a `README.md`. Register it in `.claude-plugin/marketplace.json`.
