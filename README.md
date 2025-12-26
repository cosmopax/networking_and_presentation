# Networking & Presentation (CV Ecosystem)

## Overview
Central repository for the personal brand 'Patrick Schimpl'. Contains source data, layout engines, and optimization tools.

## Directory Structure
* **`src_latex/apply_master_layout.zsh`**: **The Engine & Source of Truth**. This script generates `main.tex`. All content and layout changes must be made here.
* **`src_latex/main.tex`**: Generated artifact. **Do not edit manually**; it will be overwritten.
* **`src_json/`**: Legacy data storage.
* **`out/`**: Build artifacts (PDFs).

## Usage
1.  **Generate & Build:**
    ```zsh
    cd src_latex
    ./apply_master_layout.zsh
    # Follow prompt to build PDF
    ```
2.  **Optimize:** `cd tools_ats && ./install_matcher.sh` (first run) -> `source venv/bin/activate && streamlit run streamlit_app.py`

## Highlights
* Includes OECD 2025 Consultation entry.
* Polymathic approach (Chem + Anthro + CS).
