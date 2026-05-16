# AI API Key Request Guide

## What is an API Key?

An API key is like a password that lets your app talk to the AI. Think of it as a "key card" that gives your app access to the AI brain it needs to help you build your project.

## How to Get Your Free API Key

### Step 1: Send the Email

Open your email and compose a new message to: **jan@learnplay.co.za**

Use the subject line and body template below:

**Subject:** AI API Key Request — [Your Name]

**Body:**
```
Hi,

I'm a new developer using the LearnPlayDevAI starter workspace.
I'd like to request a free API key to connect to the AI model.

My name: [Your Name]
My email: [Your Email]
My GitHub username: [Your GitHub Username] (if you have one)

Thank you!
```

### Step 2: Wait for Your Key

The user will respond with your API key. This usually takes a few hours to one business day.

### Step 3: Save Your API Key

Once you receive your key:
1. Create a `.env` file in your project folder
2. Add this line: `AI_API_KEY=your_key_here`
3. Replace `your_key_here` with your actual key

### Step 4: Test Your Connection

Run this in your terminal:
```bash
curl -s -H "Authorization: Bearer $AI_API_KEY" \
  https://ai.learnplay.co.za/v1/models | jq .
```

If you see a list of AI models, congratulations — your connection is working!

## Important Notes

- Your API key is private — never share it publicly or commit it to git
- If your key is accidentally exposed, email jan@learnplay.co.za to get a new one
- The API key is FREE for starter workspace users