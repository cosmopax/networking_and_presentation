#!/bin/zsh
git clone https://github.com/srbhr/Resume-Matcher.git .
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo "Resume Matcher installed. Run 'streamlit run streamlit_app.py' inside tools_ats/"
