# agentic-common

Shared Claude skills, memory, and scripts for the team.

---

## Getting started (new machine)

You will need: a GitHub account and Claude Code installed.

### Step 1 — Create a GitHub Personal Access Token

A Personal Access Token (PAT) lets Claude Code download the skills from this
private repository. You only need to do this once.

1. Go to [github.com](https://github.com) and make sure you are logged in
2. Click your **profile picture** (top right) → **Settings**
3. Scroll all the way down in the left sidebar → click **Developer settings**
4. Click **Personal access tokens** → **Fine-grained tokens**
5. Click **Generate new token**
6. Fill in:
   - **Token name:** `agentic-common install`
   - **Expiration:** 90 days (or choose "No expiration" if you prefer)
   - **Repository access:** select **Only select repositories** → choose `agentic-common`
   - **Permissions → Repository permissions → Contents:** set to **Read-only**
7. Click **Generate token**
8. **Copy the token immediately** — GitHub only shows it once.
   It looks like: `github_pat_11ABCDE...`

### Step 2 — Install the skills in Claude Code

Open Claude Code and run these two commands. Replace `YOUR_TOKEN` with the
token you copied, and `YOUR_ORG` with the GitHub organisation name.

```
/plugin marketplace add https://YOUR_TOKEN@github.com/YOUR_ORG/agentic-common
```
```
/plugin install git-agent@agentic-common
```

You should see a confirmation that the plugin was installed.

### Step 3 — Set up git on your machine

Now the skills are available. Run:

```
/setup
```

Follow the prompts. Claude will guide you through the rest — no technical
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
memory/              Shared memory files (global, all agents)
agents/
  git-agent/         Skills to clone repos and contribute changes
    skills/          setup / clone / contribute
    scripts/         contribute.sh / contribute.ps1
```

## Adding a new agent

Create `agents/<agent-name>/` with a `.claude-plugin/plugin.json`, a `skills/`
dir, and a `README.md`. Add it to `marketplace.json` at the repo root.
