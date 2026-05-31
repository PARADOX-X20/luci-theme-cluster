import os
from pathlib import Path

PATCH_TEXT = """
/* =========================================================================
   TOP BAR COLOR TINT & HIGH-CONTRAST CHECKBOX OVERRIDES
   ========================================================================= */
.header, header, .topmenu, #menubar, .menubar, .nav, .navbar, [role="navigation"] {
    background: rgba(18, 18, 18, 0.75) !important;
    background-color: rgba(18, 18, 18, 0.75) !important;
    backdrop-filter: blur(12px) !important;
    -webkit-backdrop-filter: blur(12px) !important;
}
body.no-transparency .header, body:not(.blur-radius) .header, .header.opaque {
    background: #141414 !important;
    background-color: #141414 !important;
}
input[type="checkbox"], .cbi-input-checkbox {
    -webkit-appearance: none !important;
    -moz-appearance: none !important;
    appearance: none !important;
    width: 18px !important;
    height: 18px !important;
    border: 2px solid #555555 !important;
    background-color: #161616 !important;
    background-image: none !important;
    border-radius: 4px !important;
    display: inline-block !important;
    vertical-align: middle !important;
    position: relative !important;
    cursor: pointer !important;
    box-sizing: border-box !important;
}
input[type="checkbox"]:hover {
    border-color: #888888 !important;
    background-color: #202020 !important;
}
input[type="checkbox"]:checked {
    background: #ffffff !important;
    background-color: #ffffff !important;
    border-color: #ffffff !important;
}
input[type="checkbox"]:checked::after {
    content: '' !important;
    position: absolute !important;
    left: 5px !important;
    top: 1px !important;
    width: 5px !important;
    height: 9px !important;
    border: solid #000000 !important;
    border-width: 0 2.5px 2.5px 0 !important;
    transform: rotate(45deg) !important;
    display: block !important;
}
"""

targets = ["cascade.css", "main.css", "login.css"]
for path in Path('.').rglob('*.css'):
    if path.name in targets and '.git' not in path.parts:
        content = path.read_text(encoding='utf-8', errors='replace')
        if "HIGH-CONTRAST CHECKBOX OVERRIDES" not in content:
            path.write_text(content + PATCH_TEXT, encoding='utf-8')
            print(f"Successfully patched: {path}")