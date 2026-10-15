# 02 · Encrypt / Decrypt Data (Excel VBA)

Hide client names, PANs, cities and other text in an Excel sheet with one click, and bring them back with another.

![Before and after running Encrypt_Data](../assets/screenshots/encrypt-decrypt.png)

**[⬇ Download `EncryptDecrypt.bas`](EncryptDecrypt.bas)** (on that page, use **⋯ → Download**)

---

## What it does

| Macro | Effect |
|---|---|
| `Encrypt_Data` | Every letter A–Z / a–z in the selected cells becomes a Greek letter or symbol: `Demo Textiles` → `Δενο Υεωυιμετ` |
| `Decrypt_Data` | Turns those symbols back into the original letters |

What stays exactly as it was:
- **Numbers and dates.** Fees, totals and due dates are not touched.
- **Formulas.** Cells with formulas are skipped completely, so `=SUM(...)` keeps working.
- **Blanks and error values** such as `#N/A`.
- **Digits and punctuation inside text.** `ABCDE1234F` becomes `ΑΒΓΔΕ1234Ζ`.

### Good uses
- Taking screenshots or recording demos of a working file without exposing client names
- Sharing a sample of a client sheet with a colleague or software vendor
- Training article assistants on real file structures with masked names

### ⚠️ Masking, not security
This is a fixed letter-for-symbol swap, and the macro is public. **Anyone who has this macro can reverse it.** It stops casual reading, not a determined person. For real protection, use a password-protected workbook or encrypted PDF (see [01 · PDF Suite](../01-pdf-suite/)).

---

## Install (2 minutes)

1. Download `EncryptDecrypt.bas`.
2. In Excel press **Alt + F11** to open the VBA editor.
3. **File → Import File…** and pick `EncryptDecrypt.bas`. A module called *EncryptDecrypt* appears.
4. Close the editor.

**Want it in every workbook?** Import it into your **Personal Macro Workbook** (`PERSONAL.XLSB`) instead. If you don't have one yet, record any short macro once with *Store macro in: Personal Macro Workbook* and it will be created.

**Keeping it in one file?** Save that workbook as **Excel Macro-Enabled Workbook (.xlsm)**.

## Use

1. **Save your workbook first.** Macro changes can't be undone with Ctrl + Z.
2. Select the cells, columns or whole sheet you want to mask.
3. Press **Alt + F8**, choose **Encrypt_Data**, then **Run**.
4. To restore, select the same cells and run **Decrypt_Data**.

> 💡 Add both macros to the Quick Access Toolbar (File → Options → Quick Access Toolbar → *Choose commands from: Macros*) for one-click use.

---

## Notes and limitations

- If the original text already contains Greek letters or the symbols `¤ ‡ ※ ✦`, those characters will also be converted to Latin letters by `Decrypt_Data`.
- Only English letters are masked. Text in other scripts, such as Hindi or Gujarati, stays as it is.
- Protected sheets must be unprotected first; the macro tells you if one is.
- Decrypted text that looks like a number or date (for example `Jan-25`) is kept as text, so Excel doesn't convert it.

## Character map

| A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Α | Β | Γ | Δ | Ε | Ζ | Η | Θ | Ι | Κ | Λ | Μ | Ν | Ξ | Ο | Π | Ρ | Σ | Τ | Υ | Φ | Χ | Ψ | Ω | ※ | ‡ |
| α | β | γ | δ | ε | ζ | η | θ | ι | κ | λ | μ | ν | ξ | ο | π | ρ | σ | τ | υ | φ | χ | ψ | ω | ¤ | ✦ |

---

Part of [CA Toolkit](../) by CA Umang Mehta · [@mehtaknowstech](https://www.instagram.com/mehtaknowstech/) · MIT License
