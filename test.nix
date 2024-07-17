# shell.nix
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.nodejs
    pkgs.python3
    # Add other dependencies as needed
  ];

  shellHook = ''
    echo "Welcome to the development shell!"
    export MY_VARIABLE="value"
    # Add any other shell initialization code here
  '';
}
