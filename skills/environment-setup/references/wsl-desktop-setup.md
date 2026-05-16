# WSL Display Environment Setup

## What is the Display Environment?

When you run a Linux program that shows a graphical window (like a web browser), it needs a "display" — basically a virtual screen to draw on. In Linux, this is called the X11 display or `$DISPLAY` environment variable.

WSL has two ways to provide this:

1. **WSLg** (built into Windows 11) — A built-in display server. No setup needed!
2. **xvfb** (for older systems) — A virtual "framebuffer" that runs without a real screen

---

## Option 1: WSLg (Windows 11 — Recommended)

WSLg comes built-in with Windows 11. GUI apps just work.

### Step 1: Check if WSLg Is Working

In the Ubuntu terminal (inside WSL), run:

```bash
echo $DISPLAY
```

If you see something like `/mnt/wslg/.X11-lock` or `:0`, WSLg is working!

### Step 2: Test with a Simple App

```bash
# Install a test app
sudo apt install -y x11-apps

# Run it
xeyes
```

If you see a pair of eyes that follow your mouse cursor, WSLg is working perfectly!

### Step 3: Verify Chrome Works

```bash
# Check if Chrome/Chromium is available
which google-chrome || which chromium-browser || which chromium

# If installed, test it:
google-chrome --version 2>/dev/null || chromium-browser --version 2>/dev/null
```

---

## Option 2: xvfb (For Older Windows or Server Installations)

If WSLg is not available, use xvfb (X Virtual Framebuffer) to create a virtual display.

### Step 1: Install xvfb

```bash
sudo apt update
sudo apt install -y xvfb x11-apps
```

### Step 2: Start a Virtual Display

```bash
# Start a virtual display on display :99
Xvfb :99 -screen 0 1920x1080x24 &

# Export the display variable
export DISPLAY=:99

# Verify it's working
echo $DISPLAY
```

### Step 3: Test with a Simple App

```bash
xeyes
```

If `xeyes` works, the virtual display is set up correctly.

### Step 4: Make Display Persistent

Add these lines to your `~/.bashrc` file so the display is set automatically:

```bash
# WSL Virtual Display (xvfb)
if [ -z "$DISPLAY" ]; then
    export DISPLAY=:99
    # Start xvfb if not running
    pgrep Xvfb > /dev/null || Xvfb :99 -screen 0 1920x1080x24 &
fi
```

Then run: `source ~/.bashrc`

---

## Option 3: Headless Chrome (No Display at All)

If you don't need to SEE the browser (just need it for automation), use Chrome's headless mode.

### Chrome Headless Flags

When launching Chrome for automation, use these flags:

```bash
google-chrome --headless-new --no-sandbox --disable-gpu \
  --remote-debugging-port=9222 https://example.com
```

Key flags explained:
- `--headless-new` — Run without a display window
- `--no-sandbox` — Required when running as root
- `--disable-gpu` — Skip GPU rendering (no hardware available)
- `--remote-debugging-port=9222` — Allow Cline/WebClaw to connect

---

## Troubleshooting

### "cannot open display" error

This means there's no display server running. Check:
1. Are you on Windows 11? WSLg should work automatically.
2. Try `echo $DISPLAY` — if it's empty, no display is configured.
3. Try Option 2 (xvfb) above to set up a virtual display.

### "xeyes: command not found"

Install the test apps:
```bash
sudo apt install -y x11-apps
```

### "WSLg not working" on Windows 10

Windows 10 doesn't have built-in WSLg. You have two options:
1. **Upgrade to Windows 11** — Recommended
2. **Use WSL2 with X Server** — Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) on Windows and set `DISPLAY=localhost:0.0` in WSL

### Chrome still won't launch

If Chrome needs the Windows version instead of WSL Chrome:
1. Chrome launched by Cline runs from the VS Code environment
2. If VS Code is on Windows (not inside WSL), Chrome will use Windows Chrome
3. If VS Code is inside WSL, Chrome will use WSL Chrome
4. Make sure Chrome is installed in the right environment

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `echo $DISPLAY` | Check current display setting |
| `sudo apt install -y x11-apps` | Install test GUI apps |
| `xeyes` | Test if display works |
| `google-chrome --version` | Check Chrome version |
| `Xvfb :99 -screen 0 1920x1080x24 &` | Start virtual display |
| `export DISPLAY=:99` | Set display variable |