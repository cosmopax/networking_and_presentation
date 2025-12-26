#!/bin/zsh
# apply_master_layout.zsh
# Mandate: Absolute Layout (QR Left, Photo Right), Helvetica, Full Data Restoration

BASE_DIR="$HOME/projx/networking_and_presentation"
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
\usepackage[scale=0.75, top=2.5cm, right=2cm, left=2cm, bottom=2cm]{geometry}
\usepackage{qrcode}
\usepackage[absolute,overlay]{textpos}
\usepackage{xcolor}
\usepackage[scaled]{helvet}
\renewcommand\familydefault{\sfdefault}

% DEFINITIONS
\definecolor{color1}{rgb}{0.5,0.0,0.13} % Burgundy
\definecolor{darkgrey}{rgb}{0.3,0.3,0.3}

\name{Patrick}{Schimpl} 

% CUSTOM COMMANDS FOR UNIFORMITY
% Limit body text width ("imaginary vertical line")
\newcommand{\limiteddesc}[1]{%
    \begin{minipage}[t]{0.85\textwidth}%
        #1%
    \end{minipage}%
}

% Custom entry to force right-aligned Date/Location if possible, 
% or at least consistent spacing.
% ModernCV Banking: #2=Title(Bold), #3=Org, #4=Loc, #1=Year. 
% We want Title (Row 1), Org (Row 2), Info (Row 3).
% Banking renders: Title, Org, Loc, Year.
% We will hack the arguments to force line breaks and alignment.

\begin{document}

% --- ABSOLUTE HEADER ---

% 1. QR CODE 1 (GitHub)
\begin{textblock*}{2.5cm}(10mm, 10mm)
    \qrcode[height=2.0cm]{https://github.com/cosmopax}
\end{textblock*}

% 2. QR CODE 2 (EU-Peptides) - New
\begin{textblock*}{2.5cm}(10mm, 32mm)
    \qrcode[height=2.0cm]{https://eu-peptides.org}
\end{textblock*}

% 3. PHOTO (Reduced 10% -> ~4.0cm)
\begin{textblock*}{5.0cm}(160mm, 10mm)
    \IfFileExists{assets/profile.jpg}{
        \includegraphics[width=4.0cm]{assets/profile.jpg}
    }{}
\end{textblock*}

% 4. CENTER STACK (Moved UP slightly, condensed)
\begin{textblock*}{12cm}(4.5cm, 1.8cm)
    \begin{center}
        {\fontsize{28}{34}\selectfont\bfseries\color{color1} Patrick Schimpl}
        \vspace{0.2em}
        {\large\color{darkgrey} MA. MSc. \quad $\circ$ \quad Polymath}
        \vspace{0.1em}
        {\normalsize\color{darkgrey} Chem \quad $\circ$ \quad Anthro \quad $\circ$ \quad CS \quad $\circ$ \quad Futures}
        \vspace{0.3em}
        {\small\color{darkgrey} Philippovichgasse 2-4/2/16, 1190 Vienna \\ +43 699 11909500 \quad $\circ$ \quad patrick.schimpl@univie.ac.at \\ github.com/cosmopax \quad $\circ$ \quad www.eu-peptides.org}
        \vspace{0.6em}
        \textit{"Bridging molecular precision and societal foresight to engineer desirable futures."}
    \end{center}
\end{textblock*}

\vspace*{5.5cm}

% --- SECTIONS ---
% Rule: "all locations and dates stay rightbound".
% Rule: "body text runs at most to imaginary line".
% We use \limiteddesc{} for descriptions.
% We manually place dates/locations with \hfill if standard doesn't suffice.

\section{Highlight: Policy \& Consultation}
% Note: Using \hfill in arg 2 (Title) might push things? 
% Let's try standard cventry first but keeping structure clear.
\cventry{\textnormal{2025}}{Expert Consultant}{OECD - HQ}{Paris}{}{%
\limiteddesc{Invited Expert for 'Responsible Innovation and Anticipatory Governance of Emerging Biotechnologies'. Advising on governance frameworks for SynBio/AI convergence.}%
}

\section{Academic Leadership \& Mentoring}
\cventry{\textnormal{2025}}{Supervisor}{BISC-E Competition (European Finals)}{Europe}{}{%
\limiteddesc{Supervision of BOKU University Team (Bronze Medal).}%
}
\cventry{\textnormal{2024--Present}}{Judge}{iGEM Competition (Grand Jamboree)}{Global}{}{%
\limiteddesc{Evaluating global synthetic biology projects.}%
}
\cventry{\textnormal{2015--2018}}{Film Reviewer}{Ethnocineca}{Vienna}{}{%
\limiteddesc{Critical analysis of anthropological documentaries (Academic Program).}%
}
\cventry{\textnormal{2015}}{Organizing Team}{CHAGS XI}{Vienna}{}{%
\limiteddesc{Logistics/Coordination for Conference on Hunting and Gathering Societies.}%
}

\section{Academic \& Research Experience}
% Requirement: 
% Bold University
% Italic Lecturer
% Faculty...
% Conception...
% Scientific Research Affiliate...
\cventry{\textnormal{2021--Present}}{\textbf{University of Vienna}}{}{}{}{%
\limiteddesc{%
\textit{Lecturer} \newline
Faculty Chemistry, Departments: OC, TBI; IOC, formerly Faculty Biology, Department: Mol. Bio \newline
\small{Conception and Teaching of Practical Lab Course: Automation in Everyday Lab Routine; Teaching of Practical Lab Courses from various domains of Chemistry} \vspace{0.5em} \newline
%
\normalsize\textit{Scientific Research Affiliate} \newline
Faculty of Pharmacy, Department of Pharmaceutical Chemistry \newline
\textbf{R\&D Focus:} Novel Pleiotropic Neurotherapeutics \& Self-Driven Adaptive Lab Systems. \newline
\textit{Methodology: Designing teleonomic, optimization-driven agential frameworks leveraging catalytic reticular matrices.}%
}%
}

\section{Recent Publications}
% Req: Title Bold (Row 1), Subtitle Italic (Row 2), Info (Row 3)
\cvitem{2025}{%
\textbf{Design and Synthesis of Novel Pleiotropic GABAergic agents.}\newline
\textit{Status: Undisclosed pending patent application.}
}
\cvitem{2024}{%
\textbf{Holobiontic Earth - AI meets Biological Machines.}\newline
\textit{Subtitle: A futures study on the convergence of natural and artificial realms.}\newline
(ISBN 979-8333202765)
}

\section{Awards \& Strategic Achievements}
\cventry{\textnormal{2023}}{Wilhelm Exner Lectures}{Fundamental Milestone Award}{Global}{}{%
\limiteddesc{Total Synthesis of Pyochelin.}%
}
\cventry{\textnormal{2023}}{iGEM}{Silver Medal}{Global}{}{%
\limiteddesc{Biomanufacturing Sex Hormones.}%
}
\cventry{\textnormal{2023}}{University of Vienna}{Performance Scholarship}{Vienna}{}{%
\limiteddesc{Merit-based Excellence Grant.}%
}
\cventry{\textnormal{1996--1999}}{ÖSB - Austrian Chess Federation}{State Chess Champion (Vienna) \& National Bronze Medalist}{Austria}{}{%
\limiteddesc{Strategic foresight.}%
}

\section{Education}
% Req: Title first row (Bold), then University (Italic), then Specialization.
% Swapping args: #2 Title, #3 Org.
\cventry{\textnormal{2023--2025}}{MSc Chemistry (Highest Honors)}{\textit{University of Vienna}}{}{}{%
\limiteddesc{Focus: Drug Development, Bioinformatics, Automation.}%
}
\cventry{\textnormal{2019--2023}}{MA Cultural \& Social Anthropology}{\textit{University of Vienna}}{}{}{%
\limiteddesc{Focus: Futures Studies, AI Architectures.}%
}
\cventry{\textnormal{2024}}{Certified Teacher}{\textit{University of Graz}}{}{}{%
\limiteddesc{Subjects: Chemistry, Biology, Informatics.}%
}
\cventry{\textnormal{2020--2022}}{BSc Chemistry}{\textit{University of Vienna}}{}{}{%
\limiteddesc{}%
}
\cventry{\textnormal{2009--2012}}{BA Cultural \& Social Anthropology}{\textit{University of Vienna}}{}{}{%
\limiteddesc{}%
}

\section{Civic Leadership \& Non-Profit}
\cventry{\textnormal{2020--Present}}{Founder \& Director}{Artificial Life Institute}{Vienna}{}{%
\limiteddesc{Research in AI and Synthetic Biology for the greater good.}%
}
\cventry{\textnormal{2016--Present}}{Founder \& Director}{Wunderwelt}{Vienna}{}{%
\limiteddesc{Promoting autonomous local structures.}%
}

\section{Competencies}
% Req: Bold Entry in row, Specs in row below.
% \cvitem{Label}{Desc} -> reformatted.
\cvitem{}{\textbf{Hard Science}\newline \limiteddesc{Organic Synthesis, Flow Chemistry, Metabolic Engineering, NMR, HPLC}}
\cvitem{}{\textbf{Technology}\newline \limiteddesc{Python, Agential Frameworks, Git, Automation Scripting}}
\cvitem{}{\textbf{Languages}\newline \limiteddesc{German (Native), English (Fluent), Spanish/French (Advanced)}}

\end{document}
EOF

echo "✅ CV System Rebuilt."
echo -n "❓ Build PDF now? (y/n): "
read -q response
echo ""
if [[ "\$response" == "y" ]]; then
    cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
fi
