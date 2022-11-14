{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.yadm
    pkgs.ripgrep
    pkgs.exa
    pkgs.lsd
  ];
}
