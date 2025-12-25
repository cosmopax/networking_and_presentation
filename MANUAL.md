# Polymath CV Ecosystem: User Manual

## A. Core Commands
| Action | Command | Description |
| :--- | :--- | :--- |
| **Build PDF** | `cd src_latex && make` | Generates `out/main.pdf`. |
| **Edit Data** | `open -e src_json/resume.json` | Manually edit content. |
| **Sync/Backup** | `./sync_cv.sh` | Git Add + Commit + Push. |

## B. The Autonomy Engine
We are building a logic layer that adapts the CV to the audience.
* **Current Status:** `autonomy/tailor.py` exists.
* **Usage:** `python3 autonomy/tailor.py "academic research"`
* **Future:** Will connect to Gemini API to rewrite descriptions dynamically.

## C. Advanced Possibilities (Roadmap)
1.  **Multiple Templates:** Create `main_creative.tex` (sans-serif, colorful) and `main_eu.tex` (strict format).
2.  **Dynamic Landing Page:** Use your GitHub Pages as the QR target.
3.  **Cover Letter Agent:** A script that reads the JSON + Job URL and writes a 1-page PDF cover letter.
4.  **Portfolio Link:** Add a `projects.json` to generate a clickable project gallery PDF.

## D. Troubleshooting
* **QR too big?** Edit `height=0.8in` in `main.tex`.
* **Typos?** Check `resume.json`.
