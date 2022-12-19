{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.yadm
    pkgs.ripgrep
    pkgs.exa
    pkgs.lsd
    pkgs.git
  ];
  shellHook =
    ''
      alias d="lsd -A"
      alias da="lsd -Al"
    '';
}
