#!/bin/zsh
# sync_cv.sh: One-click build and backup
echo ">>> Building PDF..."
cd src_latex && make
cd ..
echo ">>> Committing to Git..."
git add .
timestamp=$(date "+%Y-%m-%d %H:%M")
git commit -m "autoupdate: CV content sync $timestamp"
git push
echo "✅ CV System Synced."
