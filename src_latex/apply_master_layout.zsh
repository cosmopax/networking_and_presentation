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
\usepackage[scale=0.75, top=2.5cm, right=2cm, left=2cm, bottom=2cm]{geometry}
\usepackage{qrcode}
\usepackage[absolute,overlay]{textpos}
\usepackage{xcolor}
% FONT: Helvetica
\usepackage[scaled]{helvet}
\renewcommand\familydefault{\sfdefault}

% DEFINITIONS
\definecolor{color1}{rgb}{0.5,0.0,0.13} % Burgundy
\definecolor{darkgrey}{rgb}{0.3,0.3,0.3}
\name{Patrick}{Schimpl} 

\begin{document}

% --- ABSOLUTE HEADER ---

% 1. QR CODE (Top Left)
% <--QR_COORDS_START-->
\begin{textblock*}{2.5cm}(10mm, 10mm)
    \qrcode[height=2.0cm]{https://github.com/cosmopax}
\end{textblock*}
% <--QR_COORDS_END-->

% 2. PHOTO (Top Right)
% <--PHOTO_COORDS_START-->
\begin{textblock*}{5.5cm}(155mm, 10mm)
    \IfFileExists{assets/profile.jpg}{
        \includegraphics[width=4.5cm]{assets/profile.jpg}
    }{}
\end{textblock*}
% <--PHOTO_COORDS_END-->

% 3. NAME & TEXT BLOCK (Centered, Adjusted down)
% <--TEXT_COORDS_START-->
\begin{textblock*}{12cm}(4.5cm, 2.5cm)
    \begin{center}
        {\fontsize{28}{34}\selectfont\bfseries\color{color1} Patrick Schimpl}
        \vspace{0.2em}
        {\large\color{darkgrey} MA. MSc. \quad $\circ$ \quad Polymath}
        \vspace{0.1em}
        {\normalsize\color{darkgrey} Chem \quad $\circ$ \quad Anthro \quad $\circ$ \quad CS \quad $\circ$ \quad Futures}
        \vspace{0.4em}
        {\small\color{darkgrey} Philippovichgasse 2-4/2/16, 1190 Vienna \\ +43 699 11909500 \quad $\circ$ \quad patrick.schimpl@univie.ac.at \\ github.com/cosmopax}
        \vspace{0.6em}
        \textit{"Bridging molecular precision and societal foresight to engineer desirable futures."}
    \end{center}
\end{textblock*}
% <--TEXT_COORDS_END-->

\vspace*{5cm}

% --- SECTIONS ---

\section{Highlight: Policy \& Consultation}
\cventry{2025}{Expert Consultant}{OECD - HQ}{Paris}{}{Invited Expert for 'Responsible Innovation and Anticipatory Governance of Emerging Biotechnologies'. Advising on governance frameworks for SynBio/AI convergence.}

\section{Academic Leadership \& Mentoring}
\cventry{2015}{Organizing Team}{CHAGS XI}{Vienna}{}{Logistics/Coordination for Conference on Hunting and Gathering Societies.}
\cventry{2025}{Supervisor}{BISC-E Competition (European Finals)}{Europe}{}{Supervision of BOKU University Team (Bronze Medal).}
\cventry{2024--Present}{Judge}{iGEM Competition (Grand Jamboree)}{Global}{}{Evaluating global synthetic biology projects.}

\section{Academic \& Research Experience}
\cventry{2021--Present}{Lecturer \& Scientific Research Affiliate}{University of Vienna}{}{}{
    Depts: Organic Chemistry, Theoretical Bioinformatics, Inorganic Chemistry. \newline
    \textbf{R\&D Focus:} Novel Pleiotropic Neurotherapeutics \& Self-Driven Adaptive Lab Systems. \newline
    \textit{Methodology: Designing teleonomic, optimization-driven agential frameworks leveraging catalytic reticular matrices.}
}

\section{Recent Publications}
\cvitem{2025}{\textbf{Design and Synthesis of Novel Pleiotropic GABAergic agents.} \newline \textit{Status: Undisclosed pending patent application.}}
\cvitem{2024}{\textbf{Holobiontic Earth - AI meets Biological Machines.} \newline \textit{Subtitle: A futures study on the convergence of natural and artificial realms.} (ISBN 979-8333202765)}

\section{Awards \& Strategic Achievements}
\cvitem{2023}{\textbf{Fundamental Milestone Award} (Wilhelm Exner Lectures) - Total Synthesis of Pyochelin.}
\cvitem{2023}{\textbf{Silver Medal} (iGEM) - Biomanufacturing Sex Hormones.}
\cvitem{1998/99}{\textbf{State Chess Champion (Vienna) \& National Bronze Medalist}. Strategic foresight.}

\section{Education}
\cventry{2023--2025}{MSc Chemistry (Highest Honors)}{University of Vienna}{}{}{}
\cventry{2019--2023}{MA Cultural \& Social Anthropology}{University of Vienna}{}{}{}
\cventry{2024}{Certified Teacher}{University of Graz}{}{}{}
\cventry{2020--2022}{BSc Chemistry}{University of Vienna}{}{}{}
\cventry{2009--2012}{BA Cultural \& Social Anthropology}{University of Vienna}{}{}{}

\section{Civic Leadership \& Non-Profit}
\cventry{2020--Present}{Founder \& Director}{Artificial Life Institute}{Vienna}{}{Research in AI and Synthetic Biology for the greater good.}
\cventry{2015--2018}{Film Reviewer}{Ethnocineca}{Vienna}{}{Critical analysis of ethnographic documentaries.}
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

echo "✅ CV System Rebuilt."
echo -n "❓ Build PDF now? (y/n): "
read -q response
echo ""
if [[ "\$response" == "y" ]]; then
    cd "$BASE_DIR/src_latex" && make && open ../out/main.pdf
fi
