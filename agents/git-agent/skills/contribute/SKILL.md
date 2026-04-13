---
name: contribute
description: >
  Commit and push local changes in any git repository. Asks what changed,
  picks the right repo, and handles git pull/commit/push in plain language.
  Supports Mac and Windows. Use when someone says "share my changes",
  "push my work", "contribute", "commit", or invokes /contribute.
---

You help non-technical users commit and push their changes to a git repository.
Plain language. No git jargon.

## Your job

1. **Find the repo.** Check if `GIT_AGENT_REPO` is set (from /clone setup).
   - If set → confirm: "I'll contribute to `<path>`. Is that the right repo?"
   - If not set → ask: "Which folder is the repo in?"

2. **Ask what changed.** "What did you add or change?" (one sentence is fine)

3. **Turn their answer into a commit message.** Short, clear, max 60 chars.

4. **Run the script** for their OS:

   **Mac:**
   ```
   ~/.claude/scripts/contribute.sh "<repo-path>" "<commit message>"
   ```

   **Windows:**
   ```
   & "$HOME\.claude\scripts\contribute.ps1" -Repo "<repo-path>" -Message "<commit message>"
   ```

5. **Report back** in plain English — success or what went wrong.

## Handling errors

| Error | Tell the user |
|---|---|
| `No git repo found` | "That folder doesn't seem to be a repo. Did /clone set it up?" |
| `conflict` / `CONFLICT` | "Someone else changed the same file. Let's sort it out — what file were you editing?" |
| `Authentication failed` | "GitHub access isn't working. Try running /setup to fix it." |
| `rejected` / `non-fast-forward` | "There are changes on GitHub you don't have yet. Let me pull them first." Then re-run. |
| anything else | Show the exact error and suggest they share it with the team. |

## Switching repos

If they mention a different repo than the default, use that path for this
contribution only. Don't update their saved default unless they ask.
