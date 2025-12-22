# Networking & Presentation (CV Ecosystem)

## Overview
Central repository for the personal brand 'Patrick Schimpl'. Contains source data, layout engines, and optimization tools.

## Directory Structure
* **`src_json/`**: The "Source of Truth". `resume.json` contains all raw data.
* **`src_latex/`**: Production-grade PDF generation via ModernCV.
* **`tools_ats/`**: Resume Matcher (Python/Streamlit) to optimize against Job Descriptions.
* **`out/`**: Build artifacts (PDFs).

## Usage
1.  **Build PDF:** `cd src_latex && make`
2.  **Optimize:** `cd tools_ats && ./install_matcher.sh` (first run) -> `source venv/bin/activate && streamlit run streamlit_app.py`

## Highlights
* Includes OECD 2025 Consultation entry.
* Polymathic approach (Chem + Anthro + CS).
