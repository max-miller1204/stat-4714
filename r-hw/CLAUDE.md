# STAT 4714 repo notes

## Rendering an R Markdown homework to PDF

The project `flake.nix` at the repo root has a heavy `devShell` (full Python
data-science stack, etc.) that takes a long time to realize on first use. For
just knitting an `.Rmd` to PDF, use this lean ad-hoc `nix-shell` instead — it
only pulls R + rmarkdown/knitr, a trimmed texlive, and pandoc:

```sh
cd r-hw/hw5   # or wherever the .Rmd lives

nix-shell -E '
with import <nixpkgs> {};
let
  rEnv = rWrapper.override { packages = with rPackages; [ rmarkdown knitr ]; };
  tex  = texlive.combine {
    inherit (texlive) scheme-medium framed titling fancyvrb upquote booktabs;
  };
in mkShell { packages = [ rEnv tex pandoc ]; }
' --run 'Rscript -e "rmarkdown::render(\"Homework5-format.Rmd\", output_format = \"pdf_document\")"'
```

Notes:

- The `.Rmd` YAML must have `output: pdf_document` (not `html_document`).
- `scheme-medium` alone is missing `framed.sty` (used by rmarkdown's code
  block styling). The extra packages above (`framed`, `titling`, `fancyvrb`,
  `upquote`, `booktabs`) are the ones rmarkdown's default LaTeX template
  pulls in — without them `pdflatex` errors out.
- If a future homework uses extra LaTeX features (e.g. `tikz`, `siunitx`,
  fancy tables), add the package name to the `inherit (texlive) ...` line.
- To render a different file, just swap the filename in the `Rscript -e`
  call.

## Rendering with the full project devShell

If you do want the full environment (Python + LaTeX + R + pandoc), use the
flake instead:

```sh
nix develop --command Rscript -e 'rmarkdown::render("Homework5-format.Rmd", output_format = "pdf_document")'
```

First invocation is slow (downloads the whole Python data stack); subsequent
invocations are instant while the store entry is alive.
