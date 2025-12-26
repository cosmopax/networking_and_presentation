Last login: Fri Dec 26 00:10:45 on ttys028
You have new mail.
#!/bin/zsh
# scaffold_cv.sh
# Creates a structured LaTeX CV environment based on moderncv
# Usage: ./scaffold_cv.sh [directory_name]

TARGET_DIR="${1:-cv_2025_workspace}"

# Check/Create Directory
if [ -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR already exists. Aborting to prevent overwrite."
    exit 1
fi

mkdir -p "$TARGET_DIR"/{src,out,assets}
cd "$TARGET_DIR" || exit

# Create Main TeX File (ModernCV Template)
cat <<EOF > src/main.tex
\documentclass[11pt,a4paper,sans]{moderncv}

% ModernCV themes
\moderncvstyle{classic} 
\moderncvcolor{blue}

% Character encoding
\usepackage[utf8]{inputenc}
\usepackage[scale=0.75]{geometry}

% Personal Data
\name{Firstname}{Lastname}
\title{Polymath | Chem | Anthro | CS} 
\address{Street 123}{12345 City}{Country}
\phone[mobile]{+1~(234)~567~890}
\email{email@example.com}
\social[github]{github_handle}

\begin{document}
\makecvtitle

\section{Experience}
\cventry{2020--Present}{Senior Polymath}{Company}{City}{}{Detailed %            (base) cosmopax@cosmopaxhaven-8 ~ % #!/bin/zsh
(base) cosmopax@cosmopaxhaven-8 ~ % # scaffold_cv.sh
(base) cosmopax@cosmopaxhaven-8 ~ % # Creates a structured LaTeX CV environment based on moderncv
(base) cosmopax@cosmopaxhaven-8 ~ % # Usage: ./scaffold_cv.sh [directory_name]
(base) cosmopax@cosmopaxhaven-8 ~ % 
(base) cosmopax@cosmopaxhaven-8 ~ % TARGET_DIR="${1:-cv_2025_workspace}"
(base) cosmopax@cosmopaxhaven-8 ~ % 
(base) cosmopax@cosmopaxhaven-8 ~ % # Check/Create Directory
(base) cosmopax@cosmopaxhaven-8 ~ % if [ -d "$TARGET_DIR" ]; then
then>     echo "Directory $TARGET_DIR already exists. Aborting to prevent overwrite."
then>     exit 1
then> fi
(base) cosmopax@cosmopaxhaven-8 ~ % 
(base) cosmopax@cosmopaxhaven-8 ~ % mkdir -p "$TARGET_DIR"/{src,out,assets}
(base) cosmopax@cosmopaxhaven-8 ~ % cd "$TARGET_DIR" || exit
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % 
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % # Create Main TeX File (ModernCV Template)
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % cat <<EOF > src/main.tex
heredoc> \documentclass[11pt,a4paper,sans]{moderncv}
heredoc> 
heredoc> % ModernCV themes
heredoc> \moderncvstyle{classic} 
heredoc> \moderncvcolor{blue}
heredoc> 
heredoc> % Character encoding
heredoc> \usepackage[utf8]{inputenc}
heredoc> \usepackage[scale=0.75]{geometry}
heredoc> 
heredoc> % Personal Data
heredoc> \name{Firstname}{Lastname}
heredoc> \title{Polymath | Chem | Anthro | CS} 
heredoc> \address{Street 123}{12345 City}{Country}
heredoc> \phone[mobile]{+1~(234)~567~890}
heredoc> \email{email@example.com}
heredoc> \social[github]{github_handle}
heredoc> 
heredoc> \begin{document}
heredoc> \makecvtitle
heredoc> 
heredoc> \section{Experience}
heredoc> \cventry{2020--Present}{Senior Polymath}{Company}{City}{}{Detailed achievements go here.}
heredoc> 
heredoc> \section{Education}
heredoc> \cventry{2015--2019}{PhD in Futures Studies}{University}{City}{}{Thesis title.}
heredoc> 
heredoc> \end{document}
heredoc> EOF
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % 
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % # Create Makefile for easy compilation (detects latexmk or docker)
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % cat <<EOF > Makefile
heredoc> .PHONY: all clean
heredoc> 
heredoc> all:
heredoc>        @if command -v latexmk >/dev/null 2>&1; then \\
heredoc>                latexmk -pdf -outdir=../out main.tex; \\
heredoc>        elif command -v docker >/dev/null 2>&1; then \\
heredoc>                docker run --rm -v "\$(PWD)/..:/data" -w /data/src blang/latex:ubuntu latexmk -pdf -outdir=../out main.tex; \\
heredoc>        else \\
heredoc>                echo "Error: Neither latexmk nor docker found."; \\
heredoc>                exit 1; \\
heredoc>        fi
heredoc>        @echo "Build successful. PDF is in out/"
heredoc> 
heredoc> clean:
heredoc>        rm -rf ../out/*
heredoc> EOF
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % 
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % # Setup instructions
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % echo "---------------------------------------------------"
---------------------------------------------------
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % echo "CV Environment created at: $(pwd)"
CV Environment created at: /Users/cosmopax/cv_2025_workspace
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % echo "To build, enter 'src' and run 'make'"
To build, enter 'src' and run 'make'
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % echo "---------------------------------------------------"
---------------------------------------------------
(base) cosmopax@cosmopaxhaven-8 cv_2025_workspace % >....                       
pip install -r requirements.txt

# 4. Prepare Directory Structure for User
mkdir -p Data/{Resumes,JobDescription}

# 5. Create a Dummy Execution Script
cat <<EOF > run_analysis.sh
#!/bin/zsh
source venv/bin/activate
# Parse Resumes first (converts PDF to JSON internally)
python run_first.py
# Run the Matcher (needs config, this is the entry point)
echo "Starting Streamlit Interface..."
streamlit run streamlit_app.py
EOF
chmod +x run_analysis.sh

echo "---------------------------------------------------"
echo "Setup Complete."
echo "1. Place your Resume PDF in: $TARGET_DIR/Data/Resumes/"
echo "2. Place Job Description PDF in: $TARGET_DIR/Data/JobDescription/"
echo "3. Run: cd $TARGET_DIR && ./run_analysis.sh"
echo "---------------------------------------------------"
Cloning Resume Matcher...
Cloning into 'resume-matcher-local'...
remote: Enumerating objects: 4101, done.
remote: Counting objects: 100% (669/669), done.
remote: Compressing objects: 100% (389/389), done.
remote: Total 4101 (delta 361), reused 495 (delta 240), pack-reused 3432 (from 3)
Receiving objects: 100% (4101/4101), 111.24 MiB | 9.87 MiB/s, done.
Resolving deltas: 100% (2069/2069), done.
Creating Python virtual environment...
Installing dependencies (this may take a moment)...
ERROR: Could not open requirements file: [Errno 2] No such file or directory: 'requirements.txt'

[notice] A new release of pip is available: 24.0 -> 25.3
[notice] To update, run: pip install --upgrade pip
---------------------------------------------------
Setup Complete.
1. Place your Resume PDF in: resume-matcher-local/Data/Resumes/
2. Place Job Description PDF in: resume-matcher-local/Data/JobDescription/
3. Run: cd resume-matcher-local && ./run_analysis.sh
---------------------------------------------------
(venv) (base) cosmopax@cosmopaxhaven-8 resume-matcher-local % >....             
## Usage
1.  **Build PDF:** \`cd src_latex && make\`
2.  **Optimize:** \`cd tools_ats && ./install_matcher.sh\` (first run) -> \`source venv/bin/activate && streamlit run streamlit_app.py\`

## Highlights
* Includes OECD 2025 Consultation entry.
* Polymathic approach (Chem + Anthro + CS).
EOF

# 6. Final Git Commit
git add .
git commit -m "feat: Initial scaffold of Polymath CV Ecosystem with OECD update" 

echo "----------------------------------------------------------------"
echo "✅ Ecosystem deployed to: $BASE_DIR"
echo "⚠️  Action Required:"
echo "1. Run: cd $BASE_DIR"
echo "2. Run: git push -u origin main"
echo "   (Make sure the repo 'networking_and_presentation' exists on your GitHub)"
echo "----------------------------------------------------------------"
>>> Initializing Polymath CV Ecosystem at /Users/cosmopax/projx/networking_and_presentation
warning: re-init: ignored --initial-branch=main
Reinitialized existing Git repository in /Users/cosmopax/projx/networking_and_presentation/.git/
Remote already exists, skipping...
[main d414acb] feat: Initial scaffold of Polymath CV Ecosystem with OECD update
 6 files changed, 165 insertions(+), 319 deletions(-)
----------------------------------------------------------------
✅ Ecosystem deployed to: /Users/cosmopax/projx/networking_and_presentation
⚠️  Action Required:
1. Run: cd /Users/cosmopax/projx/networking_and_presentation
2. Run: git push -u origin main
   (Make sure the repo 'networking_and_presentation' exists on your GitHub)
----------------------------------------------------------------
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % >....      

TARGET_DIR="$HOME/projx/networking_and_presentation"

# 1. Navigiere zum Projekt
cd "$TARGET_DIR" || { echo "❌ Verzeichnis nicht gefunden. Führe erst das Deployment-Skript aus."; exit 1; }

# 2. Erstelle Repo auf GitHub (Account: cosmopax)
# Flags: --private (Sichtbarkeit), --source=. (nutzt aktuelles Dir), --push (lädt Daten hoch)
echo ">>> Erstelle privates Repo 'cosmopax/networking_and_presentation'..."

if gh repo create cosmopax/networking_and_presentation --private --source=. --remote=origin --push; then
    echo "✅ Success: Repo created and pushed."
    echo "🔗 URL: https://github.com/cosmopax/networking_and_presentation"
else
    echo "⚠️  Error: Falls 'gh' fehlt, installiere es. Falls das Repo schon existiert, nutze:"
    echo "   git remote add origin git@github.com:cosmopax/networking_and_presentation.git"
    echo "   git push -u origin main"
fi
>>> Erstelle privates Repo 'cosmopax/networking_and_presentation'...
HTTP 401: Bad credentials (https://api.github.com/users/cosmopax)
Try authenticating with:  gh auth login
⚠️  Error: Falls 'gh' fehlt, installiere es. Falls das Repo schon existiert, nutze:
   git remote add origin git@github.com:cosmopax/networking_and_presentation.git
   git push -u origin main
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % # Prüfen, ob gh CLI bereit ist, dann Repo erstellen und pushen
if gh auth status >/dev/null 2>&1; then
    echo ">>> Authentifiziert. Erstelle Remote Repo..."
    gh repo create cosmopax/networking_and_presentation --private --source=. --remote=origin --push
else
    echo "❌ Nicht bei GitHub eingeloggt. Bitte führe zuerst aus:"
    echo "   gh auth login"
fi
❌ Nicht bei GitHub eingeloggt. Bitte führe zuerst aus:
   gh auth login
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % gh auth login
? Where do you use GitHub? GitHub.com
? What is your preferred protocol for Git operations on this host? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: 69D5-3CE3
Press Enter to open https://github.com/login/device in your browser... 
✓ Authentication complete.
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as cosmopax
! You were already logged in to this account
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % # Prüfen, ob gh CLI bereit ist, dann Repo erstellen und pushen
if gh auth status >/dev/null 2>&1; then
    echo ">>> Authentifiziert. Erstelle Remote Repo..."
    gh repo create cosmopax/networking_and_presentation --private --source=. --remote=origin --push
else
    echo "❌ Nicht bei GitHub eingeloggt. Bitte führe zuerst aus:"
    echo "   gh auth login"
fi
>>> Authentifiziert. Erstelle Remote Repo...
GraphQL: Name already exists on this account (createRepository)
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % open "https://github.com/settings/tokens?type=beta"
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % export GITHUB_PERSONAL_ACCESS_TOKEN="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"
(venv) (base) cosmopax@cosmopaxhaven-8 networking_and_presentation % #!/bin/zsh
cd "$HOME/projx/networking_and_presentation" || exit

# 1. Build the PDF using the Makefile (auto-detects Docker or Local LaTeX)
echo ">>> Building PDF Artifact..."
cd src_latex && make

# 2. Verify Output
if [ -f "../out/main.pdf" ]; then
    echo "✅ Build Successful."
    # Opens the PDF immediately on macOS
    open ../out/main.pdf
else
    echo "❌ Build Failed. Check if you have Docker or TexLive installed."
    echo "   Debug: View log in src_latex/main.log"
fi
>>> Building PDF Artifact...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii

[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 17.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 17--17

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Font Warning: Some font shapes were not available, defaults substituted.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )
(see the transcript file for additional information)pdfTeX warning (dest): name
{section*.9} has been referenced but does not exist, replaced by a fixed one

pdfTeX warning (dest): name{section*.8} has been referenced but does not exist,
 replaced by a fixed one

pdfTeX warning (dest): name{section*.7} has been referenced but does not exist,
 replaced by a fixed one

pdfTeX warning (dest): name{section*.6} has been referenced but does not exist,
 replaced by a fixed one

pdfTeX warning (dest): name{section*.5} has been referenced but does not exist,
 replaced by a fixed one

{/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/f
onts/enc/dvips/fontawesome/fontawesometwo.enc}</usr/share/texlive/texmf-dist/fo
nts/type1/public/fontawesome/FontAwesome.pfb></usr/share/texlive/texmf-dist/fon
ts/type1/public/amsfonts/cm/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/
lmss10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf
/fonts/type1/public/lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lms
so10.pfb>
Output written on ../out/main.pdf (2 pages, 122133 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii

[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 17.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 17--17

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux)

LaTeX Font Warning: Some font shapes were not available, defaults substituted.

 )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 121722 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
✅ Build Successful.
(venv) (base) cosmopax@cosmopaxhaven-8 src_latex % # Edit your raw data (Experience, Skills, OECD details)
code "$HOME/projx/networking_and_presentation/src_json/resume.json"
(venv) (base) cosmopax@cosmopaxhaven-8 src_latex % >....                        
ealms.}

\section{Awards \& Honors}
\cvitem{2023}{\textbf{Fundamental Milestone Award} (Wilhelm Exner Lectures) for 'Total Synthesis of Pyochelin'.}
\cvitem{2023}{\textbf{Silver Medal} (iGEM) for 'Biomanufacturing Sex Hormones'.} 
\cvitem{2023}{\textbf{University Performance Scholarship} (University of Vienna).}

\section{Technical Competencies}
\cvitem{Laboratory}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Computational}{Python, Machine Learning, Agential Frameworks, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish (Advanced), French (Advanced)}

\end{document}
EOF

echo "✅ Master Data & Template Updated."
echo "👉 Run: 'cd $BASE_DIR/src_latex && make' to generate the new PDF."
>>> Ingesting Full CV Data into /Users/cosmopax/projx/networking_and_presentation...
✅ Master Data & Template Updated.
👉 Run: 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make' to generate the new PDF.
(venv) (base) cosmopax@cosmopaxhaven-8 src_latex % cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/mathpazo.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1ppl.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omsppl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ppl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omlzplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omszplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omxzplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1zplm.fd)
Underfull \hbox (badness 10000) in paragraph at lines 17--17

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 136234 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/mathpazo.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1ppl.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omsppl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ppl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omlzplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omszplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omxzplm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1zplm.fd)
Underfull \hbox (badness 10000) in paragraph at lines 17--17

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux) )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 136502 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(venv) (base) cosmopax@cosmopaxhaven-8 src_latex % >....                        
## 4. Versioning
Current Version: \`1.0.0\` (Base).
Future: Run \`python3 autonomy/tailor.py [job_url]\` to generate \`main_tailored.tex\`.
EOF

# --- E. CREATE SYNC SCRIPT (Autonomy) ---
cat <<EOF > "$BASE_DIR/sync_cv.sh"
#!/bin/zsh
# sync_cv.sh: One-click build and backup
echo ">>> Building PDF..."
cd src_latex && make
cd ..
echo ">>> Committing to Git..."
git add .
timestamp=\$(date "+%Y-%m-%d %H:%M")
git commit -m "autoupdate: CV content sync \$timestamp"
git push
echo "✅ CV System Synced."
EOF
chmod +x "$BASE_DIR/sync_cv.sh"

echo "✅ System Updated. Check MANUAL.md for instructions."
>>> Updating Polymath CV Ecosystem at /Users/cosmopax/projx/networking_and_presentation...
Installing Resume Matcher...
fatal: destination path '.' already exists and is not an empty directory.
ERROR: Could not open requirements file: [Errno 2] No such file or directory: 'requirements.txt'

[notice] A new release of pip is available: 24.0 -> 25.3
[notice] To update, run: pip install --upgrade pip
✅ System Updated. Check MANUAL.md for instructions.
(base) cosmopax@cosmopaxhaven-8 tools_ats % cd ~/projx/networking_and_presentation/src_latex && make
open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii

[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 26.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 26--26



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>
<Calculating QR code for "https://github.com/cosmopax" in version 3-Q.>
<Splitting off block 1> <Splitting off block 2> <Making error block 1>
<Making error block 2> <Interleaving datablocks of length 17\ and 18:  1, 2,
3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, .>
<Interleaving errorblocks of length 18:  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
12, 13, 14, 15, 16, 17, 18, .><Interleaving complete.> <Writing data...
done.>
<Applying Mask 0... done. Calculating penalty... penalty is 1201>
<Applying Mask 1... done. Calculating penalty... penalty is 1251>
<Applying Mask 2... done. Calculating penalty... penalty is 1266>
<Applying Mask 3... done. Calculating penalty... penalty is 1200>
<Applying Mask 4... done. Calculating penalty... penalty is 1221>
<Applying Mask 5... done. Calculating penalty... penalty is 1235>
<Applying Mask 6... done. Calculating penalty... penalty is 1152>
<Applying Mask 7... done. Calculating penalty... penalty is 1207>
<Selected Mask 6>
<Encoding and writing format string... done.>
<Encoding and writing version information... done.>
<Saving QR code to memory... done.>
<Writing QR code to aux file... done.>
<Printing matrix... done.>

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Font Warning: Some font shapes were not available, defaults substituted.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )
(see the transcript file for additional information)pdfTeX warning (dest): name
{section*.8} has been referenced but does not exist, replaced by a fixed one

pdfTeX warning (dest): name{section*.7} has been referenced but does not exist,
 replaced by a fixed one

pdfTeX warning (dest): name{section*.6} has been referenced but does not exist,
 replaced by a fixed one

pdfTeX warning (dest): name{section*.5} has been referenced but does not exist,
 replaced by a fixed one

{/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/f
onts/enc/dvips/fontawesome/fontawesometwo.enc}</usr/share/texlive/texmf-dist/fo
nts/type1/public/fontawesome/FontAwesome.pfb></usr/share/texlive/texmf-dist/fon
ts/type1/public/amsfonts/cm/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/
lmss10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf
/fonts/type1/public/lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lms
so10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso12.pfb>
Output written on ../out/main.pdf (2 pages, 146620 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 26.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 26--26



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

LaTeX Font Warning: Some font shapes were not available, defaults substituted.

 )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb></usr/share/texmf/
fonts/type1/public/lm/lmsso12.pfb>
Output written on ../out/main.pdf (2 pages, 146350 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
## 1. Quick Commands
* **Edit Data:** \`open -e src_json/resume.json\` (TextEdit)
* **Build PDF:** \`cd src_latex && make\`
* **Sync Changes:** \`./sync_cv.sh\`

## 2. Dynamic Content
* **Photo:** Place a square JPG named \`profile.jpg\` in:
  \`$BASE_DIR/src_latex/assets/\`
* **QR Code:** Generated automatically in PDF.

## 3. Autonomous Optimization (ATS)
1. \`cd tools_ats/engine\`
2. \`source venv/bin/activate\`
3. \`streamlit run streamlit_app.py\`
4. Use the Web Interface to upload your PDF vs. Job Description.
EOF

echo "---------------------------------------------------"
echo "✅ Repair Complete."
echo "👉 NEXT STEP: Add your photo!"
echo "   Move your photo to: $BASE_DIR/src_latex/assets/profile.jpg"
echo "   Then run: 'cd $BASE_DIR/src_latex && make'"
echo "---------------------------------------------------"
dquote> 
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
def analyze_context(job_description_text):
    # TODO: Connect to LLM to extract keywords and 'Vibe'
    # Placeholder Logic:
    keywords = []
    if "academic" in job_description_text.lower():
        keywords.append("academic")
    if "policy" in job_description_text.lower():
        keywords.append("policy")
    return keywords

def generate_tailored_json(keywords, data):
    # Clones the master data and filters based on keywords
    print(f"Adapting CV for context: {keywords}")
    # Example: If not policy job, maybe hide OECD? (Logic to be expanded)
    return data

if __name__ == "__main__":
    print("Polymath Autonomy Engine v0.1")
    # This will be the entry point for the agent loop
EOF

echo "✅ Update Complete."
echo "👉 Action: Run 'cd $BASE_DIR/src_latex && make' to build the new CV."
>>> 🛠️ Re-Deploying Polymath CV Ecosystem...
>>> Engine already installed.
✅ Update Complete.
👉 Action: Run 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make' to build the new CV.
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
## B. The Autonomy Engine
We are building a logic layer that adapts the CV to the audience.
* **Current Status:** \`autonomy/tailor.py\` exists.
* **Usage:** \`python3 autonomy/tailor.py "academic research"\`
* **Future:** Will connect to Gemini API to rewrite descriptions dynamically.

## C. Advanced Possibilities (Roadmap)
1.  **Multiple Templates:** Create \`main_creative.tex\` (sans-serif, colorful) and \`main_eu.tex\` (strict format).
2.  **Dynamic Landing Page:** Use your GitHub Pages as the QR target.
3.  **Cover Letter Agent:** A script that reads the JSON + Job URL and writes a 1-page PDF cover letter.
4.  **Portfolio Link:** Add a \`projects.json\` to generate a clickable project gallery PDF.

## D. Troubleshooting
* **QR too big?** Edit \`height=0.8in\` in \`main.tex\`.
* **Typos?** Check \`resume.json\`.
EOF

echo "✅ Ecosystem Refined. Photo removed. Sections Split. Autonomy v1 installed."
echo "👉 Run: 'cd $BASE_DIR/src_latex && make' to see the clean version."
>>> 🚀 Refining Polymath CV & Injecting Autonomy...
✅ Ecosystem Refined. Photo removed. Sections Split. Autonomy v1 installed.
👉 Run: 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make' to see the clean version.
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
tal Synthesis of Pyochelin.}
\cvitem{2023}{\textbf{Silver Medal} (iGEM) - Biomanufacturing Sex Hormones.}
\cvitem{2023}{\textbf{Performance Scholarship} (University of Vienna).}

\section{Key Publications}
\cvitem{2025}{\textbf{Design and Synthesis of Novel Pleiotropic GABAergic agents.} \textit{Under Review.}}
\cvitem{2024}{\textbf{Holobiontic Earth - AI meets Biological Machines.} ISBN-13: 979-8333202765.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish (Advanced), French (Advanced)}

\end{document}
EOF

echo "✅ CV Polished. Photo Logic Active. Data Restored."
echo "👉 1. Move your photo to '$BASE_DIR/src_latex/assets/profile.jpg'"
echo "👉 2. Run 'cd $BASE_DIR/src_latex && make'"
>>> 💎 Polishing CV (Restoring Data & Fixing Layout)...
✅ CV Polished. Photo Logic Active. Data Restored.
👉 1. Move your photo to '/Users/cosmopax/projx/networking_and_presentation/src_latex/assets/profile.jpg'
👉 2. Run 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make'
(base) cosmopax@cosmopaxhaven-8 src_latex % Run 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make
quote> 
(base) cosmopax@cosmopaxhaven-8 src_latex % cd $BASE_DIR/src_latex && make
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 29.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 29--29



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Font Warning: Some font shapes were not available, defaults substituted.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 137206 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

LaTeX Font Warning: Font shape `OMS/qpl/m/n' undefined
(Font)              using `OMS/cmsy/m/n' instead
(Font)              for symbol `textbullet' on input line 29.

(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
Underfull \hbox (badness 10000) in paragraph at lines 29--29



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

LaTeX Font Warning: Some font shapes were not available, defaults substituted.

 )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/fontawesome/
fontawesometwo.enc}</usr/share/texlive/texmf-dist/fonts/type1/public/fontawesom
e/FontAwesome.pfb></usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/cm
/cmsy10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/share/texm
f/fonts/type1/public/lm/lmss17.pfb></usr/share/texmf/fonts/type1/public/lm/lmss
bx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 137448 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\section{Education}
\cventry{2023--2025}{MSc Chemistry (Highest Honors)}{University of Vienna}{}{}{Focus: Drug Development, Automation.}
\cventry{2019--2023}{MA Cultural \& Social Anthropology}{University of Vienna}{}{}{Focus: Futures Studies, AI Architectures.}
\cventry{2024}{Certified Teacher}{University of Graz}{}{}{Chemistry, Biology, Informatics.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\cvitem{Key Publications}{\textbf{Design and Synthesis of Novel Pleiotropic GABAergic agents} (2025, Under Review) \newline \textbf{Holobiontic Earth} (2024, ISBN 979-8333202765)}

\end{document}
EOF

echo "✅ Custom Header Built. Chess Awards Added."
echo "👉 Run: 'cd $BASE_DIR/src_latex && make'"
>>> 🏗️ Re-Architecting CV Header & Awards...
✅ Custom Header Built. Chess Awards Added.
👉 Run: 'cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make'
(base) cosmopax@cosmopaxhaven-8 src_latex % cd /Users/cosmopax/projx/networking_and_presentation/src_latex && make
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

Package textpos Warning: environment textblock* not in vertical mode. 
(textpos)                Environment textblock* should not have any text
(textpos)                or printable material appearing before it.
(textpos)                Alignment may work out wrongly. on input line 54.



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=38, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )pdfTeX warning (dest): name{section*.8} has been referenced but does not exis
t, replaced by a fixed one

{/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dist/f
onts/enc/dvips/fontawesome/fontawesometwo.enc}</usr/share/texlive/texmf-dist/fo
nts/type1/public/fontawesome/FontAwesome.pfb></usr/share/texmf/fonts/type1/publ
ic/lm/lmss10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss12.pfb></usr/share
/texmf/fonts/type1/public/lm/lmssbo10.pfb></usr/share/texmf/fonts/type1/public/
lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 227335 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty))
(/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)

Package textpos Warning: environment textblock* not in vertical mode. 
(textpos)                Environment textblock* should not have any text
(textpos)                or printable material appearing before it.
(textpos)                Alignment may work out wrongly. on input line 54.



<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=34, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texlive/texmf-dis
t/fonts/enc/dvips/fontawesome/fontawesometwo.enc}</usr/share/texlive/texmf-dist
/fonts/type1/public/fontawesome/FontAwesome.pfb></usr/share/texmf/fonts/type1/p
ublic/lm/lmss10.pfb></usr/share/texmf/fonts/type1/public/lm/lmss12.pfb></usr/sh
are/texmf/fonts/type1/public/lm/lmssbo10.pfb></usr/share/texmf/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb>
Output written on ../out/main.pdf (2 pages, 227282 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 

\end{document}
EOF

# --- 3. INTERACTIVE BUILD ---
echo "✅ Layout Architected. Data Corrected."
echo -n "❓ Do you want to build the PDF now? (y/n): "
read -q response
echo ""
if [[ "\$response" == "y" ]]; then
    echo ">>> Building PDF..."
    cd "$BASE_DIR/src_latex" && make
    echo ">>> Opening..."
    open ../out/main.pdf
else
    echo ">>> Skipped build. Run 'cd src_latex && make' later."
fi
>>> 🏛️  Architecting Final CV Layout (Master Revision)...
✅ Layout Architected. Data Corrected.
❓ Do you want to build the PDF now? (y/n): y
>>> Skipped build. Run 'cd src_latex && make' later.
(base) cosmopax@cosmopaxhaven-8 src_latex % 
(base) cosmopax@cosmopaxhaven-8 src_latex % cd src_latex && make
cd: no such file or directory: src_latex
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=34, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> (/usr/share/texmf/tex/latex/lm/t1lmr.fd)

LaTeX Font Warning: Font shape `T1/lmss/m/sc' in size <30> not available
(Font)              Font shape `T1/lmr/m/sc' tried instead on input line 41.


LaTeX Font Warning: Font shape `T1/lmss/b/sc' undefined
(Font)              using `T1/lmss/b/n' instead on input line 41.

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>]
[2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Font Warning: Some font shapes were not available, defaults substituted.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 ){/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texmf/fonts/enc/dv
ips/lm/lm-mathsy.enc}</usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/s
hare/texmf/fonts/type1/public/lm/lmss12.pfb></usr/share/texmf/fonts/type1/publi
c/lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb></usr/sha
re/texmf/fonts/type1/public/lm/lmsy10.pfb>
Output written on ../out/main.pdf (2 pages, 200745 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
      '../out/main.out'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ppl.cfg)
(/usr/share/texmf/tex/latex/lm/t1lmss.fd)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> (/usr/share/texmf/tex/latex/lm/t1lmr.fd)

LaTeX Font Warning: Font shape `T1/lmss/m/sc' in size <30> not available
(Font)              Font shape `T1/lmr/m/sc' tried instead on input line 41.


LaTeX Font Warning: Font shape `T1/lmss/b/sc' undefined
(Font)              using `T1/lmss/b/n' instead on input line 41.

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>]
[2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

LaTeX Font Warning: Some font shapes were not available, defaults substituted.

 ){/usr/share/texmf/fonts/enc/dvips/lm/lm-ec.enc}{/usr/share/texmf/fonts/enc/dv
ips/lm/lm-mathsy.enc}</usr/share/texmf/fonts/type1/public/lm/lmss10.pfb></usr/s
hare/texmf/fonts/type1/public/lm/lmss12.pfb></usr/share/texmf/fonts/type1/publi
c/lm/lmssbx10.pfb></usr/share/texmf/fonts/type1/public/lm/lmsso10.pfb></usr/sha
re/texmf/fonts/type1/public/lm/lmsy10.pfb>
Output written on ../out/main.pdf (2 pages, 200856 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
    { "title": "Holobiontic Earth - AI meets Biological Machines", "status": "Sub: A futures study on the convergence of natural and artificial realms. (2024)" }
  ],
  "skills": {
    "hard": "Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC",
    "tech": "Python, Agential Frameworks, Git, Automation Scripting",
    "lang": "German (Native), English (Fluent), Spanish (Advanced), French (Advanced)"
  }
}
EOF

echo "✅ JSON Updated with CHAGS & Ethnocineca."
echo ">>> Automatically Building PDF..."

# Automatischer Build ohne Interaktion
cd "$BASE_DIR/src_latex" || exit
make

echo ">>> Opening PDF..."
open ../out/main.pdf
>>> 🏺 Injecting Anthropological Engagement Data...
✅ JSON Updated with CHAGS & Ethnocineca.
>>> Automatically Building PDF...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Latexmk: All targets (../out/main.pdf) are up-to-date
>>> Opening PDF...
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 

\end{document}
EOF

echo "✅ JSON & LaTeX Updated. Ethnocineca & CHAGS added. Font changed to Helvetica."
echo "👉 NOW: Run the 'header_tool.py' script (see next block) to adjust positions!"
dquote> 
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ CV System Rebuilt."
echo -n "❓ Build PDF now? (y/n): "
read -q response
echo ""
if [[ "\$response" == "y" ]]; then
    cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
fi
SCRIPT_EOF

chmod +x apply_master_layout.zsh
./apply_master_layout.zsh
>>> 🏗️  Rebuilding CV Core & Layout...
✅ CV System Rebuilt.
❓ Build PDF now? (y/n): y
(base) cosmopax@cosmopaxhaven-8 src_latex % 
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               

    modified = False
    for name, (regex, grp) in patterns.items():
        match = re.search(regex, content, re.DOTALL)
        if match:
            new_val = update_coords(name, regex, match.group(grp))
            if new_val:
                content = content.replace(match.group(0), f"{match.group(1)}{new_val}{match.group(3)}")
                modified = True

    if modified:
        write_tex(content)
        print(">>> Recompiling...")
        subprocess.run("cd ../src_latex && make", shell=True)
        if sys.platform == "darwin": subprocess.run("open ../out/main.pdf", shell=True)
    else:
        print("No changes.")

if __name__ == "__main__":
    main()
PYTHON_EOF
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135969 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % # 1. Ändere die Bildbreite in der Datei auf 6cm
sed -i '' 's/\\includegraphics\[width=[0-9.]*cm\]/\\includegraphics\[width=6.0cm\]/g' ~/projx/networking_and_presentation/src_latex/main.tex

# 2. PDF neu bauen und öffnen
cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf 
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
Overfull \hbox (14.22638pt too wide) in paragraph at lines 34--35
[][]

Underfull \hbox (badness 10000) in paragraph at lines 34--35

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>]
[2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) )
(see the transcript file for additional information){/usr/share/texmf/fonts/enc
/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf-dist/fonts/enc/dvips/base/8r.
enc}</usr/share/texmf/fonts/type1/public/lm/lmsy10.pfb></usr/share/texlive/texm
f-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texlive/texmf-dist/fonts
/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/h
elvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135968 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\cventry{2016--Present}{Founder \& Director}{Wunderwelt}{Vienna}{}{Promoting autonomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ Vertical Header Architecture Applied."
echo "👉 Run manual build: cd src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Vertical Header Architecture & Content Fixes...
✅ Vertical Header Architecture Applied.
👉 Run manual build: cd src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd src_latex && make && open ../out/main.pdf
cd: no such file or directory: src_latex
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135735 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % python3 ~/projx/networking_and_presentation/autonomy/adjust_header.py
No changes.
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 

\end{document}
EOF

echo "✅ Surgical Layout applied. Header Moved Down & Left. Chronology Fixed."
echo "👉 Run manual build: cd src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Surgical Layout Fixes (V5)...
✅ Surgical Layout applied. Header Moved Down & Left. Chronology Fixed.
👉 Run manual build: cd src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 

\end{document}
EOF

echo "✅ Surgical Layout applied. Header Moved Down & Left. Chronology Fixed."
echo "👉 Run manual build: cd src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Surgical Layout Fixes (V5)...
✅ Surgical Layout applied. Header Moved Down & Left. Chronology Fixed.
👉 Run manual build: cd src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] [3] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf-
dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy10
.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/s
hare/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive
/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (3 pages, 136197 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
------------
Run number 2 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] [3] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (3 pages, 136197 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ Precision Layout V6 applied."
echo "   - Header: Up & Right (X=3.8cm, Y=0.8cm)"
echo "   - Page 2: Starts at Top (Geometry Fix)"
echo "   - Bonmot: Separated"
echo "👉 Run manual build: cd src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Final Precision Layout (V6)...
✅ Precision Layout V6 applied.
   - Header: Up & Right (X=3.8cm, Y=0.8cm)
   - Page 2: Starts at Top (Geometry Fix)
   - Bonmot: Separated
👉 Run manual build: cd src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf-
dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy10
.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/s
hare/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive
/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135936 bytes).
Transcript written on ../out/main.log.
Latexmk: References changed.
Latexmk: Log file says output to '../out/main.pdf'
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      '../out/main.aux'
------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135936 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ Layout V7 applied. Everything shifted 1.5cm down."
echo "👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Final Vertical Shift (+1.5cm) & Content Fix...
✅ Layout V7 applied. Everything shifted 1.5cm down.
👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 135999 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ Split Layout V8 applied."
echo "   - QR/Photo: Fixed UP."
echo "   - Text: Moved DOWN."
echo "   - Spacing: Compacted."
echo "👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Split-Level Layout (V8)...
✅ Split Layout V8 applied.
   - QR/Photo: Fixed UP.
   - Text: Moved DOWN.
   - Spacing: Compacted.
👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 136002 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

echo "✅ V9 Applied: Bold Dates, Edgy Name Font, Compact Header Grouping."
echo "👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf"
>>> 🏛️  Applying Bold Dates & Edgy Header Architecture (V9)...
✅ V9 Applied: Bold Dates, Edgy Name Font, Compact Header Grouping.
👉 Build: cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
(base) cosmopax@cosmopaxhaven-8 src_latex % cd ~/projx/networking_and_presentation/src_latex && make && open ../out/main.pdf
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagk8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/avantgar/uagko8a.pfb>
Output written on ../out/main.pdf (2 pages, 139859 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. BUILD & OPEN
echo ">>> Building PDF from scratch..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> Building PDF from scratch...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg> [1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map} 
<./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagk8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/avantgar/uagko8a.pfb>
Output written on ../out/main.pdf (2 pages, 139871 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V10 (Helvetica Body / Avant Garde Name)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Restoring Body Font & Normalizing Dates (V10)...
>>> Building V10 (Helvetica Body / Avant Garde Name)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 141389 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. BUILD
echo ">>> Building V11 (High Header / Bold Dates)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Applying High-Rise Layout & Bold Dates (V11)...
>>> Building V11 (High Header / Bold Dates)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 142415 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V12..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Applying Micro-Adjustments (V12)...
>>> Building V12...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 141324 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               

\section{Entrepreneurial \& Corporate Experience}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{\textnormal{2007--2019}}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{\textnormal{2004--2016}}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V13 (Balanced Spacing / Plain Dates)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Applying Balanced Spacing & Non-Bold Dates (V13)...
>>> Building V13 (Balanced Spacing / Plain Dates)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 139947 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               

\section{Entrepreneurial \& Corporate Experience}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{\textnormal{2007--2019}}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{\textnormal{2004--2016}}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V14..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Applying Final Awards Formatting & Body Lift (V14)...
>>> Building V14...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 140445 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               
onomous local structures.}

\section{Entrepreneurial \& Corporate Experience}
\cventry{2007--2019}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{2007--2019}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{2007--2019}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{2004--2016}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V15 (All Dates BOLD)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Restoring Bold Dates & Finalizing Layout (V15)...
>>> Building V15 (All Dates BOLD)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 142161 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               

\section{Entrepreneurial \& Corporate Experience}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{\textnormal{2007--2019}}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{\textnormal{2004--2016}}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V16 (Clean Contrast)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Finalizing Contrast: Bold Locations / Fine Dates (V16)...
>>> Building V16 (Clean Contrast)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
Latexmk: applying rule 'pdflatex'...
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 140445 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % >....                               

\section{Entrepreneurial \& Corporate Experience}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Biomass}{Vienna}{}{Automated cultivation systems.}
\cventry{\textnormal{2007--2019}}{Founder}{Cosmogenetic Electrotech}{Vienna}{}{Specialized electronic devices.}
\cventry{\textnormal{2007--2019}}{Founder}{Entrecote}{Vienna}{}{Modeling agency services.}
\cventry{\textnormal{2004--2016}}{Head of Customer Service}{WiSco International Freight}{Vienna}{}{Logistics optimization.}

\section{Competencies}
\cvitem{Hard Science}{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}
\cvitem{Technology}{Python, Agential Frameworks, Git, Automation Scripting}
\cvitem{Languages}{German (Native), English (Fluent), Spanish/French (Advanced)} 
\end{document}
EOF

# 3. FORCE BUILD
echo ">>> Building V17 (Uniformity & Correct Hierarchy)..."
cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
>>> 🏛️  Enforcing Strict Uniformity & Correcting Awards Hierarchy (V17)...
>>> Building V17 (Uniformity & Correct Hierarchy)...
Latexmk: This is Latexmk, John Collins, 1 January 2015, version: 4.41.
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
      'main.tex'
   Non-existent destination files:
      '../out/main.pdf'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -recorder -output-directory="../out"  "main.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 81 language(s) loaded.
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncv.cls
Document Class: moderncv 2015/07/28 v2.0.0 modern curriculum vitae and letter d
ocument class
(/usr/share/texlive/texmf-dist/tex/latex/base/size11.clo)
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty))
(/usr/share/texlive/texmf-dist/tex/latex/colortbl/colortbl.sty
(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty)))
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifluatex.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def))
(/usr/share/texmf/tex/latex/lm/lmodern.sty)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg)))
(/usr/share/texlive/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/tweaklist.sty)
(/usr/share/texlive/texmf-dist/tex/latex/tools/calc.sty)
(/usr/share/texlive/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3.sty
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/expl3-code.tex)
(/usr/share/texlive/texmf-dist/tex/latex/l3kernel/l3pdfmode.def)))
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcollection.sty)
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcompatibility.sty))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvstylebanking.sty
(/usr/share/texmf/tex/latex/tex-gyre/tgpagella.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/etexcmds.sty))))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncviconsawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesome.sty
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-generic
.tex)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/fontawesomesymbols-pdftex.
tex))) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvheadiii.sty

LaTeX Warning: You have requested package `moderncvheadiii',
               but the package provides `moderncvheadiii'.

) (/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvbodyiii.sty

LaTeX Warning: You have requested package `moderncvbodyiii',
               but the package provides `moderncvbodyiii'.

(/usr/share/texmf/tex/latex/tex-gyre/t1qpl.fd)
(/usr/share/texlive/texmf-dist/tex/latex/fontawesome/ufontawesometwo.fd)))
(/usr/share/texlive/texmf-dist/tex/latex/moderncv/moderncvcolorburgundy.sty)
(/usr/share/texlive/texmf-dist/tex/latex/base/inputenc.sty
(/usr/share/texlive/texmf-dist/tex/latex/base/utf8.def
(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/ot1enc.dfu)
(/usr/share/texlive/texmf-dist/tex/latex/base/omsenc.dfu)))
(/usr/share/texlive/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ifvtex.sty)

Package geometry Warning: Over-specification in `h'-direction.
    `width' (448.1309pt) is ignored.


Package geometry Warning: Over-specification in `v'-direction.
    `height' (633.78513pt) is ignored.

) (/usr/share/texlive/texmf-dist/tex/latex/qrcode/qrcode.sty
(/usr/share/texlive/texmf-dist/tex/latex/xkeyval/xkeyval.sty
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/share/texlive/texmf-dist/tex/generic/xkeyval/xkvutils.tex))))
(/usr/share/texlive/texmf-dist/tex/latex/textpos/textpos.sty
Package: textpos 2014/01/03 1.7j, absolute positioning of text on the page
(/usr/share/texlive/texmf-dist/tex/latex/ms/everyshi.sty)
Grid set 16 x 16 = 37.34424pt x 52.81541pt
TextBlockOrigin set to 0pt x 0pt
) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/avant.sty)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/puenc.def))

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
ABD: EveryShipout initializing macros
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(../out/main.out) (../out/main.out)


<QR code requested for "https://github.com/cosmopax" in version 0-M.>
<Error-correction level increased from M to Q at no cost.>

<Copying the QR code for "https://github.com/cosmopax" in version 3-Q as previo
usly calculated.>
(/usr/share/texmf/tex/latex/lm/ot1lmr.fd)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/share/texmf/tex/latex/lm/omllmm.fd)
(/usr/share/texmf/tex/latex/lm/omslmsy.fd)
(/usr/share/texmf/tex/latex/lm/omxlmex.fd)
<assets/profile.jpg, id=42, 340.27126pt x 440.64626pt>
<use assets/profile.jpg>
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pag.fd) [1{/var/lib/texmf/fon
ts/map/pdftex/updmap/pdftex.map} <./assets/profile.jpg>] [2] (../out/main.aux
<Reading QR code for "https://github.com/cosmopax" at level 3-Q from aux file.>

) ){/usr/share/texmf/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/share/texlive/texmf
-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texmf/fonts/type1/public/lm/lmsy1
0.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/avantgar/uagd8a.pfb></usr/
share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/share/texliv
e/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/texlive/texmf-dist
/fonts/type1/urw/helvetic/uhvro8a.pfb>
Output written on ../out/main.pdf (2 pages, 140649 bytes).
Transcript written on ../out/main.log.
Latexmk: Log file says output to '../out/main.pdf'
Latexmk: All targets (../out/main.pdf) are up-to-date
(base) cosmopax@cosmopaxhaven-8 src_latex % 
