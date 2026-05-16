# Verify Cline + WebClaw Connection

## What Are We Verifying?

We want to make sure:
1. Cline is installed and working in VS Code
2. WebClaw MCP server is connected to Cline
3. Cline can control a web browser through WebClaw

## Step 1: Check Cline Connection

1. Open VS Code
2. Click the Cline icon in the sidebar
3. Look for a "connected" status indicator (usually green checkmark)
4. Type a message like "Hello, can you hear me?"
5. Cline should respond

If Cline is connected and responding, you're halfway there!

## Step 2: Check WebClaw Connection

1. In the Cline chat, type: "Can you use WebClaw to take a screenshot?"
2. Cline should respond that it's connecting to the browser
3. If WebClaw is connected, you'll see browser activity

## Step 3: Test Browser Control

Ask Cline to do something simple with the browser:
```
Can you navigate to example.com using WebClaw?
```

If WebClaw is working:
- A browser window will open
- It will navigate to example.com
- Cline will show you a screenshot

## Step 4: Verify in VS Code Status Bar

Look at the bottom status bar of VS Code:
1. You should see the Cline extension icon
2. Hover over it — it should show "Cline: Connected"
3. For WebClaw, check the output panel (View → Output)
4. Select "Cline" from the dropdown
5. You should see MCP connection logs

## Expected Results

When everything works, you should see:
- ✅ Cline responds to your messages
- ✅ WebClaw shows as "connected" in Cline
- ✅ Browser opens when Cline uses WebClaw commands
- ✅ Screenshots appear in the Cline chat

## Troubleshooting

### Cline shows "disconnected"
- Check your internet connection
- Verify your API key in `.env`
- Try reloading VS Code (`Ctrl+Shift+P` → "Developer: Reload Window")

### WebClaw shows "disconnected"
- Restart VS Code after configuring `cline_mcp_settings.json`
- Check that Node.js is installed: `node --version`
- Check that Chrome/Chromium is installed
- Look for errors in the Cline output panel

### Browser doesn't open
- Make sure Chrome or Chromium is installed
- WebClaw downloads Chrome on first run — this may take a minute
- Check your internet connection

### JSON error in cline_mcp_settings.json
- Make sure the JSON is valid (no trailing commas)
- Check all brackets are closed: `{}` and `[]`
- Use https://jsonlint.com/ to validate your JSON