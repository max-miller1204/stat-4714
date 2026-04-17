{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      rPkgs = with pkgs.rPackages; [
        rmarkdown
        knitr
      ];
      rWithPackages = pkgs.rWrapper.override { packages = rPkgs; };
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-small
          collection-fontsrecommended
          framed;
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          rWithPackages
          pkgs.pandoc
          tex
        ];
      };
    };
}
