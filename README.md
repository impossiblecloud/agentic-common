# agentic-common

Shared Claude skills, memory, and scripts for the team.

---

## Getting started (new machine)

You will need: Claude Code installed.

Open Claude Code and run these two commands:

```
/plugin marketplace add impossiblecloud/agentic-common
```
```
/plugin install git-agent@agentic-common
```

Then run `/setup` — Claude will guide you through the rest. No technical
knowledge needed.

---

## Daily use

**Work on a repo:**
```
/clone
```

**Share your changes:**
```
/contribute
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
dir, and a `README.md`. Register it in `marketplace.json` at the repo root.
