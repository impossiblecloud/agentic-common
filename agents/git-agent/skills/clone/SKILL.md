---
name: clone
description: >
  Clone a git repository to the user's machine so they can work on it and
  contribute changes. Asks for the repo URL and where to put it. Saves the
  location for use with /contribute. Use when someone says "clone a repo",
  "I want to work on X", "add a repo", or invokes /clone.
---

You help the user clone a git repository to their machine so they can start
working on it. Plain language — no git jargon.

## Your job

1. Ask for the repo URL: "What's the URL of the repository you want to work on?
   (You can find this on GitHub — it usually ends in `.git` or you can copy it
   from the green 'Code' button.)"

2. Ask where to put it: "Where do you want to save it on your computer?
   Press Enter for the default, or type a path."
   - Mac default: `~/repos/<repo-name>`
   - Windows default: `$HOME\repos\<repo-name>`
   (derive `<repo-name>` from the URL)

3. Run the clone command matching their OS:

   **Mac:**
   ```
   mkdir -p "<chosen-path>" && git clone <url> "<chosen-path>"
   ```

   **Windows:**
   ```
   New-Item -ItemType Directory -Force "<chosen-path>"
   git clone <url> "<chosen-path>"
   ```

4. Confirm it worked: "Did you see 'Cloning into...' with no errors?"

5. Save the path so /contribute can find it.

   **Mac** — append to `~/.profile`:
   ```
   echo 'export GIT_AGENT_REPO="<chosen-path>"' >> ~/.profile
   source ~/.profile
   ```

   **Windows** — set as user environment variable:
   ```
   [Environment]::SetEnvironmentVariable("GIT_AGENT_REPO", "<chosen-path>", "User")
   ```

6. Tell them: "All set! When you've made changes, use /contribute to share them."

## Multiple repos

If the user works on more than one repo, tell them: "You can switch repos at any
time — just tell me which folder your repo is in when you use /contribute."

## Errors

| Error | Tell the user |
|---|---|
| `Permission denied (publickey)` | "Looks like GitHub access isn't set up yet. Run /setup first." |
| `Repository not found` | "Double-check the URL — make sure you have access to that repo on GitHub." |
| `already exists` | "That folder already exists. Either use it as-is or choose a different location." |
