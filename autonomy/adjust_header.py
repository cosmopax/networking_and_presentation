import re, os, subprocess, sys

TEX_FILE = "../src_latex/main.tex"

def read_tex():
    with open(TEX_FILE, 'r') as f: return f.read()

def write_tex(content):
    with open(TEX_FILE, 'w') as f: f.write(content)

def update_coords(name, regex, current_val):
    print(f"\n--- Adjusting {name} (Current: {current_val}) ---")
    new_val = input(f"New coords (e.g. '10mm, 10mm') [Enter to skip]: ")
    return new_val if new_val.strip() else None

def main():
    if not os.path.exists(TEX_FILE): return print("Run layout script first.")
    content = read_tex()
    patterns = {
        "QR Code": (r'(<--QR_COORDS_START-->\s*\\begin\{textblock\*\}\{[^}]+\}\()([^)]+)(\))', 2),
        "Photo": (r'(<--PHOTO_COORDS_START-->\s*\\begin\{textblock\*\}\{[^}]+\}\()([^)]+)(\))', 2),
        "Text Block": (r'(<--TEXT_COORDS_START-->\s*\\begin\{textblock\*\}\{[^}]+\}\()([^)]+)(\))', 2)
    }
    
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
