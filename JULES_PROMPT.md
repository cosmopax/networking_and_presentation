<instruction>You are an expert software engineer. You are working on a WIP branch. Please run `git status` and `git diff` to understand the changes and the current state of the code. Analyze the workspace context and complete the mission brief.</instruction>
<workspace_context>
<artifacts>
--- CURRENT TASK CHECKLIST ---
# CV Update Task List

- [x] Analyze Project Structure <!-- id: 0 -->
    - [x] Explore src_latex and src_json to understand generation process <!-- id: 1 -->
    - [x] Identify key files for header, body, and content <!-- id: 2 -->
- [x] Create Implementation Plan <!-- id: 3 -->
- [x] Implement Header Changes <!-- id: 4 -->
    - [x] Add second QR code (eu-peptides.org) <!-- id: 5 -->
    - [x] Adjust vertical spacing for name/email/github <!-- id: 6 -->
    - [x] Add line for website addresses <!-- id: 7 -->
    - [x] Reduce photo size by 10% <!-- id: 8 -->
- [x] Implement Body Layout Changes <!-- id: 9 -->
    - [x] Apply text width limit (imaginary vertical line) <!-- id: 10 -->
    - [x] Ensure right-bound locations and dates <!-- id: 11 -->
- [x] Standardize Formatting <!-- id: 12 -->
    - [x] Unify fonts and sizes for organization names <!-- id: 13 -->
    - [x] Standardize vertical spacing between rows and sections <!-- id: 14 -->
- [x] Update Content Sections <!-- id: 15 -->
    - [x] **Education**: Swap Title/University, add 3rd row for specialization <!-- id: 16 -->
    - [x] **Competencies**: Bold entry row, specs below <!-- id: 17 -->
    - [x] **Publications**: Title bold, subtitle italic, info 3rd row <!-- id: 18 -->
    - [x] **Academic/Research**: Specific formatting for Univ. Vienna, Lecturer, Departments, etc. <!-- id: 19 -->
- [x] Verification <!-- id: 20 -->
    - [x] Compass changes against user instructions <!-- id: 21 -->
    - [x] **Git**: Created new repo `CV_flow` and pushed.

--- IMPLEMENTATION PLAN ---
# CV Update Implementation Plan

## Goal
Update the CV content and layout based on specific user requirements, including adding a second QR code, adjusting header geometry, constraining body text width, and refining section formatting (Education, Competencies, Research).

## User Review Required
> [!IMPORTANT]
> **Source of Truth**: The file `apply_master_layout.zsh` contains the hardcoded LaTeX content and generates `main.tex`. All edits will be applied to this script, not `main.tex` directly.
>
> **Build Environment**: I will modify the script. Verification of the final PDF relies on the user running the script and build process, as I cannot run the Docker container.

## Proposed Changes

### Configuration & Layout (`apply_master_layout.zsh`)

#### [MODIFY] [apply_master_layout.zsh](file:///Users/cosmopax/Desktop/networking_and_presentation%20copy_v17%20copy/src_latex/apply_master_layout.zsh)

1.  **Header Structure**:
    *   **QR Codes**: Add a second `textblock` for `eu-peptides.org` QR code below the GitHub one.
    *   **Photo**: Reduce `includegraphics` width by 10% (keeping top-left anchor).
    *   **Contact Info**: Move the central name/contact block up slightly. Add a new line for website addresses below email/GitHub.
    *   **Tagline**: Ensure distance to tagline ("Bridging...") remains consistent.

2.  **Global Body Layout**:
    *   Adjust `geometry` or `\cventry` definition to restrict the text width (creating the "imaginary vertical line" effect).
    *   Ensure visual consistency for dates/locations (right-aligned).

3.  **Section Formatting**:
    *   **Education**: Swap `Title` and `University` arguments in `\cventry`. Add a 3rd row for specialization details (MSc/MA).
    *   **Competencies**: Convert `\cvitem` to a format where the Label is on its own bold line, followed by the description on the next line.
    *   **Publications**: Format as:
        *   Row 1: **Title** (Bold)
        *   Row 2: *Subtitle* (Italic)
        *   Row 3: Status/ISBN (Normal)
    *   **Academic & Research Experience**:
        *   Format "University of Vienna" (Bold).
        *   "Lecturer..." (Italic).
        *   "Faculty..." rows with specific indentation/fonts.

## Verification Plan

### Automated Tests
- None available (Docker required).

### Manual Verification
- **Code Review**: I will display the diffs of `apply_master_layout.zsh` to ensure the LaTeX code injection matches the requirements.
- **User Action**:
    1.  Run `./apply_master_layout.zsh`
    2.  Check the output PDF.
</artifacts>
</workspace_context>
<mission_brief>[Describe your task here...]</mission_brief>