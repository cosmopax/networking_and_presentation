import json
import sys
import os

# CONFIG
MASTER_JSON = "../src_json/resume.json"
OUTPUT_JSON = "../src_json/resume_tailored.json"

def load_cv():
    with open(MASTER_JSON, 'r') as f:
        return json.load(f)

def tailor_cv(context_keywords):
    """
    Simulates AI reasoning: Hides/Reorders sections based on keywords.
    """
    data = load_cv()
    print(f"🤖 Agent: Analyzing CV against context '{context_keywords}'...")
    
    # LOGIC 1: If purely corporate, maybe hide OECD or move it down?
    # LOGIC 2: If academic, expand publication details.
    
    if "corporate" in context_keywords:
        print("   -> Strategy: Prioritizing Enterprise section.")
        # (Placeholder for reordering logic in list)
        
    if "academic" in context_keywords:
        print("   -> Strategy: Ensuring Research is top section.")

    # In a real agent, we would rewrite the 'desc' fields here using LLM.
    
    print(f"✅ Tailored JSON written to {OUTPUT_JSON}")
    # For now, we just dump the master as tailored (passthrough)
    with open(OUTPUT_JSON, 'w') as f:
        json.dump(data, f, indent=2)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 tailor.py [keywords/url]")
        sys.exit(1)
    tailor_cv(sys.argv[1])
