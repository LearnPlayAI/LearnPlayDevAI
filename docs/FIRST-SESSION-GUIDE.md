# First Session Guide — What Happens When You Open Cline

This document describes the conversation flow that happens when a new user opens Cline for the first time. The AI agent follows this structured flow to guide the user from "I have an app idea" to "I have a working project."

---

## Phase 1: Welcome & Environment Check

**Agent says:**
```
Hello! I'm so glad you're here! Welcome to your AI-powered development workspace.

I can see you've pulled this starter workspace. I'm going to help you build whatever app
you can imagine — no coding experience needed!

Let me first check your setup...
```

**Agent actions:**
1. Runs `scripts/detect-environment.sh`
2. Parses the JSON output
3. Reports back what's installed and what's missing

**Agent says (example):**
```
Great! I can see you're running on Linux with WSL. You have:
✓ Git installed
✓ Node.js installed
✓ Python 3 installed
✓ jq installed

Everything looks good — you're ready to start!
```

---

## Phase 2: Account & API Setup

**Agent checks:**
1. Is `.env` file present with AI_API_KEY?
2. Is GitHub connected (git config --global user.name)?

**If API key is missing:**
```
I see you don't have an API key yet. You'll need to request one from jan@learnplay.co.za
It's completely FREE! Here's a template you can use for the email...
```

**If GitHub is not connected:**
```
You'll also want a GitHub account to store your code online. Let me walk you through setting that up...
```

---

## Phase 3: Project Planning

**User says:**
```
I want to create an app that [describes their idea]
```

**Agent actions:**
1. Loads `skills/saas-platform-planner/SKILL.md` context
2. Asks clarifying questions about the app
3. Recommends a tech stack using the decision matrix
4. Presents a scaffold plan

**Agent says (example):**
```
That sounds great! Based on what you're describing, I recommend:
- Frontend: Next.js (React) — great for web apps
- Backend: Python FastAPI — easy to learn and powerful
- Database: PostgreSQL — reliable and well-supported

Here's the plan for your project structure:
├── apps/
│   ├── web/   (your frontend)
│   └── api/   (your backend)
└── infra/     (Docker setup)

Does this look good to you?
```

---

## Phase 4: Project Scaffolding

**Agent actions:**
1. Creates the project structure
2. Initializes git repository
3. Creates memory bank with project context
4. Generates `.env.example`
5. Creates initial Docker Compose

**Agent says:**
```
Perfect! I've set up your project structure. Here's what I created:
[list of files]

Let me show you around...
```

---

## Phase 5: First Development Session

**Agent actions:**
1. Walks through the project structure
2. Explains where key files are
3. Helps user make their first code change
4. Guides them through running the app locally

**Agent says (example):**
```
Let's run your app for the first time! Open the terminal and run:
docker compose up

Then we'll check if it's working by opening it in the browser...
```

---

## Phase 6: Ongoing Development

After the initial setup, the agent enters ongoing mode:
- Guides feature development step by step
- Helps debug issues
- Reviews code and suggests improvements
- Guides testing and deployment
- Updates memory bank as the project evolves

---

## Example User Messages

The agent should recognize these common user messages:

| User Message | Agent Response |
|-------------|---------------|
| "I want to create a todo app" | Start Phase 3 — Plan the project |
| "How do I install Git?" | Start Phase 1 — Guide installation |
| "I don't have an API key" | Guide to request from jan@learnplay.co.za |
| "What is WSL?" | Explain: "WSL lets Windows run Linux tools" |
| "My app isn't working" | Debug mode — ask for error messages |
| "I want to add [feature]" | Plan and implement the feature |

---

## Important Agent Behaviors

1. **One step at a time** — Never overwhelm with multiple commands
2. **Celebrate wins** — "Great job! You just made your first commit!"
3. **Explain everything** — "Git is like a save point for your project"
4. **Confirm completion** — "Did that work for you?" before moving on
5. **Never assume knowledge** — Explain every technical term on first use