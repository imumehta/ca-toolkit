<div align="center">

# CA Toolkit

**Free, offline, privacy-first tools for Chartered Accountants and finance teams.**

Built by **CA Umang Mehta**, Partner at BRS & Associates, Chartered Accountants, Jamnagar.

[**▶ Try it live**](https://imumehta.github.io/ca-toolkit/) · [Instagram @mehtaknowstech](https://www.instagram.com/mehtaknowstech/)

![No sign-up](https://img.shields.io/badge/sign--up-none-2F5D50) ![Runs offline](https://img.shields.io/badge/runs-offline-172554) ![Nothing uploaded](https://img.shields.io/badge/uploads-zero-EA6A12) ![License: MIT](https://img.shields.io/badge/license-MIT-9A7B34)

</div>

---

## 🧰 Tools

| # | Tool | Type | What it does |
|---|------|------|--------------|
| 01 | [**PDF Suite**](01-pdf-suite/) | HTML | 15 PDF tools in one file: merge, split, protect, redact, compress, number, stamp, convert |
| 02 | [**Encrypt / Decrypt Data**](02-encrypt-decrypt-vba/) | Excel VBA | Mask client names, PANs and other text in selected cells with one click, and restore it just as easily |
| 03 | More tools | | *Coming soon* |

---

## 📄 01 · PDF Suite

![PDF Suite: merging financial statements](assets/screenshots/merge.png)

A complete PDF workbench in a **single HTML file** (about 4 MB). Every engine is embedded, so it runs entirely inside your browser:

- **No internet needed.** It works on an air-gapped office PC.
- **Nothing is uploaded.** Client files and passwords never leave your machine.
- **Nothing to install.** Double-click the file and it opens in Chrome or Edge.

### The 15 tools

| Assemble | Security | Optimise & mark up | Convert & housekeeping |
|---|---|---|---|
| **Merge PDFs**, with optional "Annexure n of N" divider pages | **Unlock PDF**, removing a known password while keeping the text | **Compress PDF** for e-mail and government portals | **Images → PDF** (JPG, PNG, WEBP) |
| **Split / Extract** by ranges or every N pages | **Protect PDF** with AES-256 plus print/copy/edit permissions | **Page Numbers**: sections, Bates, Roman | **PDF → Images** (JPG/PNG) |
| **Organise Pages**: drag to reorder, rotate, delete, duplicate, insert blanks | **Redact Data**: auto-detects PAN, Aadhaar, GSTIN, TAN, bank a/c, IFSC, mobile, e-mail and PIN | **Watermark**: "Certified true copy", "Draft" | **PDF → Word / Text** |
| | | **Stamps**: Audited, Approved, Verified · **Signature & Seal** | **Document Details**: inspect, edit or wipe metadata |

<table>
<tr>
<td width="50%"><img src="assets/screenshots/redact.png" alt="Redaction"><br><sub><b>True redaction.</b> Matches are found automatically, and affected pages are rebuilt as images so hidden text can't be recovered.</sub></td>
<td width="50%"><img src="assets/screenshots/organise.png" alt="Organise pages"><br><sub><b>Visual organiser.</b> Thumbnails, shift-click ranges, rotate and reorder.</sub></td>
</tr>
<tr>
<td><img src="assets/screenshots/protect.png" alt="Protect"><br><sub><b>Batch AES-256.</b> Protect a whole set of reports with one password before e-mailing.</sub></td>
<td><img src="assets/screenshots/dark-mode.png" alt="Dark mode"><br><sub><b>Dark mode</b> for late-night filing seasons.</sub></td>
</tr>
</table>

### How to use

**Option A: online.** Open the [live version](https://imumehta.github.io/ca-toolkit/01-pdf-suite/). It still runs 100% in your browser.

**Option B: offline (recommended for client work).**
1. Download [`01-pdf-suite/index.html`](01-pdf-suite/index.html) (on that page, use **⋯ → Download**).
2. Save it anywhere, e.g. your desktop, as `PDF_Suite.html`.
3. Double-click to open it in Chrome or Edge.

> 💡 **Tip:** Name files `01_`, `02_`, `03_` … and use **Sort A–Z** in Merge to get annexure order right in one click.

---

## 🔤 02 · Encrypt / Decrypt Data (Excel VBA)

![Client list before and after Encrypt_Data](assets/screenshots/encrypt-decrypt.png)

Two macros for Excel. **`Encrypt_Data`** turns every letter in the selected cells into a Greek letter or symbol (`Demo Textiles` → `Δενο Υεωυιμετ`), and **`Decrypt_Data`** turns it back. Numbers, dates and formulas are never touched, so totals keep working.

Handy for screenshots, demos and sample files where client names shouldn't be readable. It is **masking, not password security**: anyone with the macro can reverse it.

**[Install guide and download →](02-encrypt-decrypt-vba/)**

---

## 🔒 Privacy

- No servers, analytics, cookies or network requests. The PDF Suite runs in your browser tab and the macros run inside your own Excel.
- The only thing the PDF Suite stores locally is your light/dark theme preference.
- Only process documents you are authorised to handle.

## 🏗️ Built with

These open-source engines are embedded in the HTML file:

| Engine | Purpose | License |
|---|---|---|
| [pdf-lib](https://github.com/Hopding/pdf-lib) 1.17.1 | Creating and editing PDFs | MIT |
| [PDF.js](https://github.com/mozilla/pdf.js) 3.11.174 | Rendering pages and extracting text | Apache-2.0 |
| [JSZip](https://github.com/Stuk/jszip) 3.10.1 | "Download all" as .zip | MIT / GPLv3 (used under MIT) |
| [qpdf](https://github.com/qpdf/qpdf) 11 (WebAssembly) | AES-256 encryption and decryption | Apache-2.0 |

See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## 🤝 Feedback

Found a bug or have an idea for a tool that would save CAs time? [Open an issue](../../issues) or DM [@mehtaknowstech](https://www.instagram.com/mehtaknowstech/) on Instagram.

## 📜 License

[MIT](LICENSE) © 2026 Umang Mehta. Free to use, share and adapt, with attribution.
