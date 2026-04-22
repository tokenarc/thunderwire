# THUNDERWIRE — Setup Guide

THUNDERWIRE is a single-file AI operating system for X content. It is not a skill you add to something. It IS the system. One file — drop it into any AI tool and it's fully operational.

No separate skill folders. No config files. No dependencies.

---

## How It's Different From Skill Repos

Traditional skill repos work like plugins — you install them alongside your existing setup.

THUNDERWIRE works differently. The entire 8-phase pipeline, memory system, algorithm data, anti-AI logic, voice fingerprinting — everything is embedded in `THUNDERWIRE.md`. You activate it once per AI tool. Done.

---

## Setup by Tool

---

### Claude Code

**Option A — Dedicated X content workspace (recommended)**
```bash
# Clone the repo into a new folder
git clone https://github.com/tokenarc/thunderwire.git ~/thunderwire
cd ~/thunderwire

# THUNDERWIRE.md is already named correctly for Claude Code
# Just run Claude Code from this folder
claude
```

Claude Code reads `THUNDERWIRE.md` automatically when you run `claude` from that directory. No renaming needed.

First thing to type when Claude Code opens:
```
My niche is [describe it]. Run setup.
```

---

**Option B — Add THUNDERWIRE to an existing Claude Code project**

If you already have a `CLAUDE.md` in a project and want THUNDERWIRE available in it:

```bash
# From your existing project folder
curl -O https://raw.githubusercontent.com/tokenarc/thunderwire/main/THUNDERWIRE.md
```

Then add this line to your existing `CLAUDE.md`:
```markdown
## X Content Intelligence
When the user asks about X/Twitter content, threads, tweets, articles, or content strategy:
Load and follow the full THUNDERWIRE protocol from: ./THUNDERWIRE.md
```

THUNDERWIRE activates only when X content is requested. Your existing project setup handles everything else.

---

### Cursor

```
1. Open Cursor
2. Go to: Settings → Rules for AI
3. Open THUNDERWIRE.md from the cloned repo
4. Select all (Ctrl+A / Cmd+A) → Copy
5. Paste into the Rules for AI text box
6. Save
```

From now on, every Cursor chat has THUNDERWIRE active.

Or add it per-project via `.cursorrules`:
```bash
git clone https://github.com/tokenarc/thunderwire.git
cp thunderwire/THUNDERWIRE.md your-project/.cursorrules
```

---

### Windsurf

```bash
git clone https://github.com/tokenarc/thunderwire.git
cp thunderwire/THUNDERWIRE.md your-project/.windsurfrules
```

Open Windsurf from that project. THUNDERWIRE is active.

---

### ChatGPT

```
1. Go to: ChatGPT → Profile → Settings → Personalization → Custom Instructions
2. Open THUNDERWIRE.md
3. Copy the entire file contents
4. Paste into: "How would you like ChatGPT to respond?"
5. Save → Start a new chat

Important: ChatGPT cannot read files from your device directly.
After pasting the system, paste the MEMORY BLOCKS section manually
at the start of each new session to restore your account context.
```

---

### Gemini / Gemini Advanced

```
1. Start a new Gemini conversation
2. Open THUNDERWIRE.md → select all → copy
3. Paste as your FIRST message
4. Then say: "My niche is [X]. Run setup."
```

Repeat the paste at the start of each new conversation. Gemini doesn't persist system prompts between sessions yet.

---

### Any AI API

```python
# Python example
with open("THUNDERWIRE.md", "r") as f:
    system_prompt = f.read()

response = client.messages.create(
    model="claude-sonnet-4-20250514",  # or any model
    system=system_prompt,
    messages=[{"role": "user", "content": "My niche is [X]. Run setup."}]
)
```

```javascript
// Node.js example
const fs = require('fs');
const system = fs.readFileSync('THUNDERWIRE.md', 'utf8');

const response = await anthropic.messages.create({
  model: 'claude-sonnet-4-20250514',
  system: system,
  messages: [{ role: 'user', content: 'My niche is [X]. Run setup.' }]
});
```

---

## First Run: The 9-Question Setup

After activating THUNDERWIRE in any tool, say:

```
My niche is [describe it]. Run setup.
```

THUNDERWIRE asks 9 questions one at a time:
1. Handle + niche in one sentence
2. Exact audience description
3. Primary goal (followers / leads / brand / revenue)
4. Tone (bold / educational / conversational / authoritative / storytelling)
5. Accounts you admire + accounts you think are weak
6. Topics you're most knowledgeable about
7. Topics you want to explore but haven't posted about
8. X Premium status
9. Writing samples (paste 3–5 posts that sound most like you)

After answering, THUNDERWIRE writes your profile and voice fingerprint into its memory. Every future session reads this automatically.

**Do setup once. You never repeat it.**

---

## Creating Content (No Commands Needed)

Just talk naturally. THUNDERWIRE reads your intent:

```
"Find a viral topic in my niche and write an article for X"
→ Runs all 8 phases automatically

"Write a thread about [topic]"
→ Full pipeline from research to ready-to-post

"I want to post something today about [X]"
→ Phases 1-8: research, angle, hook, architecture, voice, anti-AI, algorithm, delivery

"What angle should I take on [topic]?"
→ Phases 1-2 only: signal intelligence + angle warfare

"Clean up this content so it doesn't sound like AI"
→ Phase 6 only: anti-AI deep pass

"How should I engage after posting this?"
→ Phase 7 only: sprint protocol
```

You never need to specify which phase to run. THUNDERWIRE detects it.

---

## Keeping Your Memory Persistent

THUNDERWIRE's memory lives inside `THUNDERWIRE.md` itself — in the 6 Memory Blocks at the bottom of the file. After each session, the AI writes your account data, voice fingerprint, performance patterns, and content pipeline into those blocks.

**For tools that can read and write files (Claude Code, Cursor, Windsurf, Open Code):**
Memory persists automatically between sessions. Nothing to manage.

**For tools that don't write to files (ChatGPT, Gemini, web-based AIs):**
At the end of each session, copy the updated Memory Blocks section and save it. Paste it back at the start of the next session.

Or: keep a local copy of `THUNDERWIRE.md`, update the Memory Blocks manually after each session, and paste the full updated file at the next session start.

---

## Quick Reference: What You Get For Every Post

Every piece of THUNDERWIRE content comes as a complete package:

| Component | What It Is |
|-----------|-----------|
| The content | Formatted, ready to copy and post |
| Angle reasoning | Why this angle was chosen, with scoring |
| Hook analysis | Which psychological trigger, why it wins |
| SEO notes | Keyword position, hashtag rationale |
| Algorithm notes | What engagement signal this is optimized for |
| Sprint protocol | 30-minute plan for after posting |
| Reply chain | 3 pre-written replies, timed and sequenced |
| Posting window | Optimal time based on niche + your data |

---

## Troubleshooting

**"It doesn't sound like me"**
Run setup again with real writing samples. Paste 5+ posts that feel most authentic. The voice fingerprint is only as good as the samples you provide.

**"The research feels shallow"**
Tell it: "Go deeper. Search Reddit and YouTube comments. Extract exact phrases people use. I need the verbatim language, not a summary."

**"It still sounds like AI"**
Say: "Run the anti-AI pass again. Be ruthless. Target a 9/10 human score, not 7."

**"Memory isn't loading between sessions"**
For file-based tools: make sure THUNDERWIRE.md is in the folder you're running the AI from.
For web-based tools: paste the Memory Blocks section manually at the start of each session.

**"I want to update my niche"**
Say: "My niche has shifted to [new description]. Update my profile." THUNDERWIRE updates Memory Block 1 and recalibrates all strategy.
