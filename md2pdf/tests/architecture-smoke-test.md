# md2pdf Architecture Smoke Test

This markdown file verifies that Mermaid diagrams are rendered as vector assets and embedded in the output PDF.

## Data pipeline

```mermaid
flowchart TD
  M["Markdown input"] --> CLI["md2pdf CLI"]
  CLI --> P["Pandoc + Mermaid filter"]
  P --> SVG["High-resolution Mermaid assets"]
  SVG --> PDF["PDF output"]
```

## How to run

```bash
md2pdf ./tests/architecture-smoke-test.md
```

Optional: keep generated Mermaid assets for inspection.

```bash
md2pdf ./tests/architecture-smoke-test.md --keep-mermaid-assets
```

