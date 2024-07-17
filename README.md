# nixos-rust-opengl-template
Contains a shell.nix that makes graphic programming work with rust without the funny crashes you usually get when you try such things on Nixos.

## Testing
Build the dev shell then run cargo like so:
```
nix-shell
cargo run
```
Result should be an example maliciously stolen from [three-d](https://github.com/asny/three-d).
