# 📌 Campus Confession Wall

> A mini web project — anonymous confession feed for college students.  
> Built with **HTML · CSS · XML · XSLT** — Zero JavaScript, Zero backend.

---

## 🚀 Live Demo

Hosted on GitHub Pages → `https://<your-username>.github.io/campus-confession-wall/`

---

## 📂 Project Structure

```
campus-confession-wall/
├── index.html        → Homepage (landing page)
├── confessions.xml   → Data file (all confession posts)
├── confessions.xsl   → XSLT transformer (XML → styled HTML feed)
├── style.css         → Shared stylesheet for both pages
└── README.md         → This file
```

---

## 🧠 How It Works

| File | Role |
|---|---|
| `index.html` | Product landing page — hero, features, preview cards, CTA |
| `confessions.xml` | Stores all posts (category, text, likes). Links to the XSL file via processing instruction |
| `confessions.xsl` | XSLT stylesheet — transforms XML into a full styled HTML confession feed |
| `style.css` | Single shared CSS file used by both the homepage and the XSLT output |

When a browser opens `confessions.xml`, it reads the `<?xml-stylesheet?>` instruction at the top and automatically applies `confessions.xsl`, rendering a styled feed — no server needed.

---

## 🖥️ Running Locally

### Option 1 — VS Code Live Server (Recommended)
1. Install [VS Code](https://code.visualstudio.com/)
2. Install the **Live Server** extension by Ritwick Dey
3. Open the project folder in VS Code
4. Right-click `index.html` → **Open with Live Server**
5. Visit `http://127.0.0.1:5500`

### Option 2 — Python
```bash
python -m http.server 8080
# then open http://localhost:8080
```

### Option 3 — Firefox Only (no server)
Drag `index.html` directly into Firefox. XSLT transforms work natively on `file://` in Firefox.

> ⚠️ Chrome blocks XSLT on `file://` — always use a local server or Firefox for local testing.

---

## 🌐 Deploying to GitHub Pages

```bash
# 1. Create a new repo on github.com named: campus-confession-wall

# 2. Inside your project folder:
git init
git add .
git commit -m "Initial commit — Campus Confession Wall"
git branch -M main
git remote add origin https://github.com/<your-username>/campus-confession-wall.git
git push -u origin main

# 3. Go to: GitHub repo → Settings → Pages → Deploy from branch → main → / (root)
# 4. Your site will be live at:
#    https://<your-username>.github.io/campus-confession-wall/
```

---

## 🎨 Design

- **Fonts:** Playfair Display (headings) · DM Sans (body)
- **Theme:** Warm cream base `#faf8f4` · Coral accent `#e05b3a`
- **Category colours:** Love → Pink · Funny → Yellow · Rant → Red · Study → Blue
- **Animations:** CSS-only page load + floating card loop
- **Responsive:** Mobile-friendly via CSS Grid + Flexbox

---

## 🏷️ Category Tags

| Tag | Colour | Emoji |
|---|---|---|
| Love | Pink | ❤️ |
| Funny | Yellow | 😂 |
| Rant | Red | 😤 |
| Study | Blue | 📚 |
| Other | Grey | 🤫 |

---

## ⚙️ Tech Stack

| Technology | Usage |
|---|---|
| HTML5 | Page structure |
| CSS3 | Styling, animations, responsive layout |
| XML | Data storage (confession posts) |
| XSLT 1.0 | Data transformation (XML → HTML) |

**No JavaScript. No frameworks. No backend. No database.**

---

## 📝 License

Made for educational purposes · WT Mini Project · 2025  
All confessions are fictional and for demonstration only.
