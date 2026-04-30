# Edge AI Sentinel Monitor

An interactive HTML5 demo simulating an edge AI device that monitors physical assets in real time, detects anomalies, captures evidence, and reports to an operator — all running locally on the device without cloud dependency.

---

## Live Demo

👉 [Click here to launch the demo](#) *(replace with your GitHub Pages URL)*

No installation required. Opens and runs in any modern browser.

---

## What It Demonstrates

The demo simulates the full observe → detect → capture → report loop of an edge AI sentinel device:

- **Live sensor stream** — a depth/vibration sensor reading updates every 120 ms, staying within a normal ±0.5% variance band
- **Anomaly simulation** — trigger a threshold breach on demand to see how the edge device responds
- **Evidence capture** — when an anomaly is detected, the device locks the reading and captures a visual evidence frame locally
- **Operator workflow** — address the alert and watch the device run a follow-up verification reading before closing the event
- **Multiple asset targets** — switch between different monitored asset types (e.g. LED indicator, vibration sensor) to see how the system adapts its detection method and alert copy
- **Activity log** — a running timestamped log of all system events in the session

---

## How to Use the Demo

| Control | What it does |
|---|---|
| **Simulate Anomaly** | Injects a 5–7.5% spike or drop into the sensor reading, triggering an alert |
| **Address Alert** | Marks the event as handled; the device runs a verification reading |
| **Reset** | Clears all state and returns to nominal monitoring |
| **Pause / Resume Stream** | Freezes or resumes the live sensor feed |
| **Asset target buttons** | Switches the monitored asset type mid-session |

---

## Running Locally

The demo is a single self-contained `index.html` file with no external dependencies.

**Quickest option — just open the file:**
```
Double-click index.html
```
This works for most browsers. If controls don't respond, use the server method below.

**Reliable option — serve over HTTP:**
```bash
# Mac / Linux
python3 -m http.server 8000

# Windows
py -3 -m http.server 8000
```
Then open `http://localhost:8000` in your browser.

**Or use the included helper scripts:**
```bash
# Mac / Linux
chmod +x start-demo.sh
./start-demo.sh

# Windows
start-demo.bat
```
The scripts start the server and open the browser automatically.

---

## Files

| File | Purpose |
|---|---|
| `index.html` | The complete demo application — self-contained, no build step |
| `start-demo.sh` | Mac/Linux launcher script |
| `start-demo.bat` | Windows launcher script |

---

## Technical Notes

- Pure HTML5, CSS, and vanilla JavaScript — no frameworks, no build tools, no external requests
- All simulation logic runs client-side; nothing is sent to a server
- Designed for desktop viewports (1280px+)
- Tested in Chrome, Firefox, and Safari
