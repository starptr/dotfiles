{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.ripgrep
    pkgs.exa
    pkgs.lsd
  ];
}
