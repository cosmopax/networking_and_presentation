#!/bin/zsh
# apply_master_layout.zsh
# Mandate: Absolute Layout (QR Left, Photo Right), Helvetica, Full Data Restoration

# Get the directory where the script is located (src_latex) and go up one level
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo ">>> 🏗️  Rebuilding CV Core & Layout..."

# --- 1. JSON RESTORATION (With CHAGS, Ethno, Chess) ---
cat <<EOF > "$BASE_DIR/src_json/resume.json"
{
  "basics": {
    "name": "Patrick Schimpl",
    "titles": "MA. MSc.",
    "label": "Polymath",
    "sublabel": "Chem", "sublabel2": "Anthro", "sublabel3": "CS", "sublabel4": "Futures",
    "email": "patrick.schimpl@univie.ac.at",
    "phone": "+43 699 11909500",
    "url": "https://github.com/cosmopax",
    "location": "Vienna, Austria",
    "mission": "Bridging molecular precision and societal foresight to engineer desirable futures."
  },
  "sections": {
    "policy": [
      {
        "role": "Expert Consultant",
        "org": "OECD (Headquarters)",
        "year": "2025",
        "loc": "Paris",
        "desc": "Invited Expert for 'Responsible Innovation and Anticipatory Governance of Emerging Biotechnologies'. Advising on governance frameworks for SynBio/AI convergence."
      }
    ],
    "academic_leadership": [
      {
        "role": "Organizing Team",
        "org": "CHAGS XI (Vienna)",
        "year": "2015",
        "desc": "Conference on Hunting and Gathering Societies. Logistics and coordination for the premier global hunter-gatherer conference."
      },
      {
        "role": "Supervisor",
        "org": "BISC-E Competition (European Finals)",
        "year": "2025",
        "desc": "Supervision of BOKU University Team (Bronze Medal)."
      },
      {
        "role": "Judge",
        "org": "iGEM Competition (Grand Jamboree)",
        "year": "2024--Present",
        "desc": "Evaluating global synthetic biology projects."
      }
    ],
    "research": [
      {
        "role": "Lecturer & Scientific Research Affiliate",
        "org": "University of Vienna",
        "year": "2021--Present",
        "desc": "Depts: Organic Chemistry, Theoretical Bioinformatics, Inorganic Chemistry.\\\\ \\textbf{R\&D Focus:} Novel Pleiotropic Neurotherapeutics \& Self-Driven Adaptive Lab Systems.\\\\ \\textit{Methodology: Designing teleonomic, optimization-driven agential frameworks leveraging catalytic reticular matrices for sustainable synthesis.}"
      }
    ],
    "civic": [
      {
        "role": "Founder & Director",
        "org": "Artificial Life Institute",
        "year": "2020--Present",
        "desc": "Research in AI and Synthetic Biology for the greater good."
      },
      {
        "role": "Film Reviewer",
        "org": "Ethnocineca",
        "year": "2015--2018",
        "desc": "Critical analysis of ethnographic documentaries for the Vienna Anthropology Film Festival."
      },
      {
        "role": "Founder & Director",
        "org": "Wunderwelt",
        "year": "2016--Present",
        "desc": "Promoting autonomous local structures and urban sustainability."
      }
    ],
    "enterprise": [
      {
        "role": "Founder",
        "org": "Cosmogenetic Biomass",
        "year": "2007--2019",
        "desc": "Design & Distribution of automated cultivation systems."
      },
      {
        "role": "Founder",
        "org": "Cosmogenetic Electrotech",
        "year": "2007--2019",
        "desc": "Specialized electronic devices for automation."
      },
      {
        "role": "Founder",
        "org": "Entrecote",
        "year": "2007--2019",
        "desc": "Modeling agency and photography services."
      },
      {
        "role": "Head of Customer Service",
        "org": "WiSco International Freight",
        "year": "2004--2016",
        "desc": "Logistics optimization and key account management."
      }
    ],
    "education": [
      {
        "role": "MSc Chemistry (Highest Honors)",
        "org": "University of Vienna",
        "year": "2023--2025",
        "desc": "Focus: Drug Development, Bioinformatics, Automation."
      },
      {
        "role": "MA Cultural & Social Anthropology",
        "org": "University of Vienna",
        "year": "2019--2023",
        "desc": "Focus: Futures Studies, AI Architectures."
      },
      {
        "role": "Certified Teacher",
        "org": "University of Graz",
        "year": "2024",
        "desc": "Chemistry, Biology, Informatics."
      },
      {
        "role": "BSc Chemistry",
        "org": "University of Vienna",
        "year": "2020--2022",
        "desc": ""
      },
      {
        "role": "BA Cultural & Social Anthropology",
        "org": "University of Vienna",
        "year": "2009--2012",
        "desc": ""
      }
    ]
  },
  "awards": [
    { "title": "Fundamental Milestone Award", "org": "Wilhelm Exner Lectures", "year": "2023", "desc": "Total Synthesis of Pyochelin." },
    { "title": "Silver Medal", "org": "iGEM", "year": "2023", "desc": "Biomanufacturing Sex Hormones." },
    { "title": "State Chess Champion (Vienna)", "org": "ÖSB", "year": "1998", "desc": "Youth League." },
    { "title": "National Bronze Medalist (3rd Place)", "org": "Austrian National Chess Championship", "year": "1999", "desc": "Youth Category." }
  ],
  "publications": [
    { "title": "Design and Synthesis of Novel Pleiotropic GABAergic agents", "status": "Undisclosed pending patent application (2025)" },
    { "title": "Holobiontic Earth - AI meets Biological Machines", "status": "Sub: A futures study on the convergence of natural and artificial realms. (2024)" }
  ],
  "skills": {
    "hard": "Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC",
    "tech": "Python, Agential Frameworks, Git, Automation Scripting",
    "lang": "German (Native), English (Fluent), Spanish (Advanced), French (Advanced)"
  }
}
EOF

# --- 2. UPDATE LATEX (Absolute Layout, Helvetica) ---
cat <<EOF > "$BASE_DIR/src_latex/main.tex"
\documentclass[11pt,a4paper,sans]{moderncv}
\moderncvstyle{banking}
\moderncvcolor{burgundy}
\usepackage[utf8]{inputenc}
% ADJUSTED GEOMETRY
\usepackage[scale=0.75, top=2.0cm, right=2cm, left=2cm, bottom=2cm]{geometry}
\usepackage{qrcode}
\usepackage[absolute,overlay]{textpos}
\usepackage{xcolor}
\usepackage[scaled]{helvet}
\renewcommand\familydefault{\sfdefault}

% DEFINITIONS
% DEFINITIONS
\definecolor{color1}{RGB}{128,0,32} % Bordeaux
\definecolor{darkgrey}{rgb}{0.3,0.3,0.3}

% --- SINGLE SOURCE OF TRUTH: SPACING & LAYOUT ---
% DIAGNOSIS: Inconsistencies caused by hardcoded 'vspace' values scattered across commands.
% FIX: Centralized length definitions. Adjust here to propagate everywhere.

% 1. Section Headline -> First Bold Row (Ref: Policy->OECD)
% User Rule: 50% of Previous (0.025em) -> Target 0.0125em.
\newlength{\gapSectionBold}
\setlength{\gapSectionBold}{0.0125em}

% 2. Bold Row -> Italic Row (Ref: OECD->Expert Consultant)
% User Rule: "Increase" / "2x B_ref". Previous was -0.2em (Tight).
% Adjusted to -0.1em (Less tight = Larger gap).
\newlength{\gapBoldItalic}
\setlength{\gapBoldItalic}{-0.1em}

% 3. Italic Row -> First Normal Row (Ref: Expert->Invited)
% User Rule: 75% of Previous (0.015em) -> Target 0.01125em.
\newlength{\gapItalicNormal}
\setlength{\gapItalicNormal}{0.01125em}

% 4. Entry -> Entry Spacing
% User Rule: Match "Academic... Czechs 11". Standardized to 0.4em.
\newlength{\gapEntry}
\setlength{\gapEntry}{0.4em}

\name{Patrick}{Schimpl} 

% CUSTOM COMMANDS
\newcommand{\limiteddesc}[1]{%
    \noindent\begin{minipage}[t]{14.0cm}% Width = 16cm (target) - 2cm (left margin) = 14cm
        \linespread{0.9}\small\mdseries\selectfont % Consistent Normal Font & Spacing
        #1%
    \end{minipage}%
}

% Fix Section Spacing & Rule Position (Underscore Style)
\usepackage{etoolbox}
\makeatletter
% Reduce space before section title
\patchcmd{\section}{\vspace*{2.5ex}}{\vspace*{1.0ex}}{}{}
\renewcommand*{\section}[1]{%
  \par\addvspace{2.5ex}%
  \phantomsection{}%
  \addcontentsline{toc}{section}{#1}%
  {\par\noindent\Large\bfseries\color{color1}#1}\par%
  \vspace{-0.9em}\noindent\color{color1}\rule{\linewidth}{0.6pt}\par\nobreak\vspace*{\gapSectionBold}% Use Variable
  \color{black}
}
\makeatother

% Command for Publications
\newcommand{\pubentry}[2]{%
  \par\vspace{\gapSectionBold} % Match Section->Bold spacing for consistency
  \noindent\begin{minipage}[t]{14.0cm}
    #2
  \end{minipage}%
  \hfill%
  \begin{minipage}[t]{0.12\textwidth}
    \raggedleft 
    \vspace*{1.2em} % Vertical alignment offset for Right Side Date
    {\small\mdseries #1} 
  \end{minipage}%
  \par\addvspace{\gapEntry} % Use Variable
}

% REFINED CVENTRY (Unified Variables)
\renewcommand*{\cventry}[6]{%
  \vspace{\gapSectionBold}% Start with minimal gap (consistent with Section->Bold)
  \noindent%
  \begin{minipage}[t]{\linewidth}%
    % Row 1: Bold Content (#2) | Right: Bold Location (#4)
    {\large\bfseries\color{black}#2}\hfill{\small\bfseries\color{black}#4}\par%
    \vspace{\gapBoldItalic} % Use Variable
    % Row 2: Italic Content (#3) | Right: Date (#1)
    {\large\itshape\color{black}#3}\hfill{\small\mdseries\color{black}#1}\par%
    % Description
    \vspace{\gapItalicNormal}% Use Variable
    {\small\mdseries\color{black}#6}%
  \end{minipage}%
  \par\addvspace{\gapEntry}% Use Variable
}

\begin{document}

% --- ABSOLUTE HEADER ---

% 1. QR CODE 1 (GitHub) - Start at 1.4cm
\begin{textblock*}{2.5cm}(10mm, 14mm)
    {\color{black}\qrcode[height=2.0cm]{https://github.com/cosmopax}}
\end{textblock*}

% 2. QR CODE 2 (EU-Peptides) - Start at 3.9cm (Moved up 0.5cm)
\begin{textblock*}{2.5cm}(10mm, 39mm)
    {\color{black}\qrcode[height=2.0cm]{https://eu-peptides.org}}
\end{textblock*}

% 3. PHOTO (4.5cm)
\begin{textblock*}{5.5cm}(160mm, 10mm)
    \IfFileExists{assets/profile.jpg}{
        \includegraphics[width=4.5cm]{assets/profile.jpg}
    }{}
\end{textblock*}

% 4. CENTER STACK 
% Center stack positioning
% Moving down slightly to 1.5cm to align with QR top approx
\begin{textblock*}{12.5cm}(3.5cm, 1.5cm)
    \begin{center}
        {\fontfamily{pag}\selectfont\fontsize{34}{40}\selectfont\bfseries\color{color1} Patrick Schimpl}
        \vspace{0.1em}
        
        {\Large\color{black} MA. MSc.}
        \vspace{0.8em} 
        
        {\large\color{darkgrey} Chem \hspace{0.3em}$\circ$\hspace{0.3em} Anthro \hspace{0.3em}$\circ$\hspace{0.3em} CS \hspace{0.3em}$\circ$\hspace{0.3em} Futures}
        \vspace{0.2em}
        
        % Contact Block - Explicitly separated rows
        % Row 1: Address + Phone
        {\small\color{darkgrey} Philippovichgasse 2-4/2/16, 1190 Vienna \hspace{0.3em}$\circ$\hspace{0.3em} +43 699 11909500} \par
        \vspace{-0.15em}
        % Row 2: Email + Github
        {\small\color{darkgrey} patrick.schimpl@univie.ac.at \hspace{0.3em}$\circ$\hspace{0.3em} github.com/cosmopax} \par
        \vspace{-0.15em}
        % Row 3: Website (Explicit Par)
        {\small\color{darkgrey} www.eu-peptides.org}
        
        \vspace{1.0em}
        \textit{\color{black}"Bridging molecular precision and societal foresight to engineer desirable futures."}
    \end{center}
\end{textblock*}

% Body Start Position
% QR Code 2 ends at 4.4cm (start) + 2.0cm (height) = 6.4cm.
% Top Margin is 2.0cm.
% We need vspace such that 2.0 + vspace > 6.4.
% Let's use 5.2cm -> 7.2cm total. Clears QRs comfortably.
\vspace*{4.7cm}
\color{black} % Ensure Body Text is Black


% --- SECTIONS ---

\section{Highlight: Policy \& Consultation}
\cventry{\textnormal{2025}}{OECD - HQ}{Expert Consultant}{Paris}{}{%
\limiteddesc{Invited Expert for 'Responsible Innovation and Anticipatory Governance of Emerging Biotechnologies'. Advising on governance frameworks for SynBio/AI convergence.}%
}

\section{Academic Leadership \& Mentoring}
\cventry{\textnormal{2025}}{BISC-E Competition (European Finals)}{Supervisor}{Europe}{}{%
\limiteddesc{Supervision of BOKU University Team (Bronze Medal).}%
}
\cventry{\textnormal{2024--Present}}{iGEM Competition (Grand Jamboree)}{Judge}{Global}{}{%
\limiteddesc{Evaluating global synthetic biology projects.}%
}
\cventry{\textnormal{2015--2018}}{Ethnocineca}{Film Reviewer}{Vienna}{}{%
\limiteddesc{Critical analysis of anthropological documentaries (Academic Program).}%
}
\cventry{\textnormal{2015}}{CHAGS XI}{Organizing Team}{Vienna}{}{%
\limiteddesc{Logistics/Coordination for Conference on Hunting and Gathering Societies.}%
}

\section{Academic \& Research Experience}
% SWAP: Org (#2 Bold) is Univ Vienna. Role (#3 Italic) is Lecturer.
\cventry{2021--Present}{University of Vienna}{Lecturer}{}{}{%
\limiteddesc{%
\normalsize\mdseries\upshape Faculty Chemistry, Departments: OC, TBI; IOC, formerly Faculty Biology, Department: Mol. Bio \newline
\normalsize{Conception and Teaching of Practical Lab Course: Automation in Everyday Lab Routine; Teaching of Practical Lab Courses from various domains of Chemistry}%
}%
}
% NEW ROW: Univ Vienna (Bold), Sci Research Affil (Italic), 2023-Present (Time)
\cventry{2023--Present}{University of Vienna}{Scientific Research Affiliate}{}{}{%
\limiteddesc{%
\normalsize\mdseries\upshape Faculty of Pharmacy, Department of Pharmaceutical Chemistry \newline
\textit{R\&D Focus:} Novel Pleiotropic Neurotherapeutics \& Self-Driven Adaptive Lab Systems. \newline % Italic
\textit{Methodology: Designing teleonomic, optimization-driven agential frameworks leveraging catalytic reticular matrices.}%
}%
}

\section{Recent Publications}
\pubentry{2025}{%
{\large\bfseries Design and Synthesis of Novel Pleiotropic GABAergic agents.}\newline 
{\large\itshape (Italic Subtitle)}\newline % Large Italic (Consistent)
{\small Status: Undisclosed pending patent application.}% Normal Status
}

\pubentry{2024}{%
{\large\bfseries Holobiontic Earth - AI meets Biological Machines.}\newline 
{\large\itshape Subtitle: A futures study on the convergence of natural and artificial realms.}\newline % Large Italic (Consistent)
{\small (ISBN 979-8333202765)}% Normal ISBN
}

\section{Awards \& Strategic Achievements}
% SWAP: Fundamental (#2 Bold) <-> Wilhelm (#3 Italic)
\cventry{2023}{Fundamental Milestone Award}{Wilhelm Exner Lectures}{Global}{}{%
\limiteddesc{Total Synthesis of Pyochelin.}%
}
\cventry{2023}{Silver Medal}{iGEM}{Global}{}{%
\limiteddesc{Biomanufacturing Sex Hormones.}%
}
\cventry{2023}{Performance Scholarship}{University of Vienna}{Vienna}{}{%
\limiteddesc{Merit-based Excellence Grant.}%
}
\cventry{1996--1999}{State Chess Champion (Vienna) \& National Bronze Medalist}{ÖSB - Austrian Chess Federation}{Austria}{}{%
\limiteddesc{Strategic foresight.}%
}

\section{Education}
% SWAP BACK TO ORIGINAL: Title (#2 Bold) <-> Univ (#3 Italic)
\cventry{2023--2025}{MSc Chemistry (Highest Honors)}{University of Vienna}{}{}{%
\limiteddesc{Focus: Drug Development, Bioinformatics, Automation.}%
}
\cventry{2019--2023}{MA Cultural \& Social Anthropology}{University of Vienna}{}{}{%
\limiteddesc{Focus: Futures Studies, AI Architectures.}%
}
\cventry{2024}{Certified Teacher}{University of Graz}{}{}{%
\limiteddesc{Subjects: Chemistry, Biology, Informatics.}%
}
\cventry{2020--2022}{BSc Chemistry}{University of Vienna}{}{}{} 
\cventry{2009--2012}{BA Cultural \& Social Anthropology}{University of Vienna}{}{}{} 

\section{Civic Leadership \& Non-Profit}
\cventry{2020--Present}{Artificial Life Institute}{Founder \& Director}{Vienna}{}{%
\limiteddesc{Research in AI and Synthetic Biology for the greater good.}%
}
\cventry{2016--Present}{Wunderwelt}{Founder \& Director}{Vienna}{}{%
\limiteddesc{Promoting autonomous local structures.}%
}

\section{Competencies}
\cvitem{}{\large\bfseries Hard Science \newline \limiteddesc{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}}
\cvitem{}{\large\bfseries Technology \newline \limiteddesc{Python, Agential Frameworks, Git, Automation Scripting}}
\cvitem{}{\large\bfseries Languages \newline \limiteddesc{German (Native), English (Fluent), Spanish/French (Advanced)}}

\end{document}
EOF

echo "✅ CV System Rebuilt."
echo -n "❓ Build PDF now? (y/n): "
read -q response
echo ""
if [[ "$response" == "y" ]]; then
    cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
fi
