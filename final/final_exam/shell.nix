{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "stat4714-final-latex";

  buildInputs = [
    pkgs.pandoc
    pkgs.texliveMedium
  ];

  shellHook = ''
    echo "STAT 4714 LaTeX env: pandoc $(pandoc --version | head -n1 | awk '{print $2}'), $(pdflatex --version | head -n1)"
    echo "Build: make pdf   (or: pandoc Final_Exam_Study.md -o Final_Exam_Study.pdf --pdf-engine=xelatex)"
  '';
}
