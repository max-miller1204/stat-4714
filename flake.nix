{
  description = "STAT 4714 — LaTeX build environment for proposal/report and R analysis";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        tex = pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-medium latexmk biber enumitem;
        };

        rEnv = pkgs.rWrapper.override {
          packages = with pkgs.rPackages; [
            tidyverse
            ggplot2
            dplyr
            tidyr
            readr
            knitr
            rmarkdown
            boot
          ];
        };

        pythonEnv = pkgs.python312.withPackages (ps: with ps; [
          numpy
          pandas
          scipy
          matplotlib
          statsmodels
          scikit-learn
          jupyter
          requests
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            tex
            rEnv
            pythonEnv
            pkgs.pandoc
          ];

          shellHook = ''
            echo "STAT 4714 dev shell"
            echo "  latexmk : $(latexmk --version 2>/dev/null | head -1)"
            echo "  R       : $(R --version 2>/dev/null | head -1)"
            echo "  python  : $(python --version 2>/dev/null)"
            echo ""
            echo "Build proposal: cd final && latexmk -pdf proposal.tex"
          '';
        };

        packages.proposal = pkgs.stdenvNoCC.mkDerivation {
          name = "stat4714-proposal";
          src = ./final;
          nativeBuildInputs = [ tex ];
          buildPhase = ''
            latexmk -pdf -interaction=nonstopmode proposal.tex
          '';
          installPhase = ''
            mkdir -p $out
            cp proposal.pdf $out/
          '';
        };

        packages.default = self.packages.${system}.proposal;
      });
}
