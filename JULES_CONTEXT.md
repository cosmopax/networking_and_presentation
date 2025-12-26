# Project Context for Jules

**Project**: `CV_flow` (Automated CV Generation System)

## Core Workflow
This project uses a script-based generation approach to maintain strict control over the LaTeX layout.

- **Primary Controller**: `src_latex/apply_master_layout.zsh`
    - This script contains the LaTeX header, preambles, and the content itself (in `cat <<EOF` blocks).
    - It enforces the "Absolute Layout" (QR codes, Photo geometry) and the "Imaginary Line" text constraint.
- **Output**: `src_latex/main.tex` (Generated file).

## Recent Architecture Changes
1.  **Repository Move**: Migrated from `networking_and_presentation` to `CV_flow`.
2.  **Layout**:
    - **Header**: Dual QR Codes (GitHub + eu-peptides), resized Photo (top-right).
    - **Body**: Custom `\limiteddesc` command limits text width to 85% to create a clean right margin for dates/locations.
3.  **Content**:
    - Specific formatting for "University of Vienna" (Lecturer/Research Affiliate) roles.
    - Swapped Title/University order in Education section.

## How to Contribute
- **Editing Content**: Always edit `apply_master_layout.zsh`. Do not edit `main.tex` directly.
- **Building**: Run `./apply_master_layout.zsh` from the `src_latex` directory.
