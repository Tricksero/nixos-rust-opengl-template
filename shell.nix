{ pkgs ? import <nixpkgs> { } }:
let
  deps = [
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.pre-commit
    pkgs.rustPackages.clippy
    pkgs.alsa-lib
    pkgs.udev
    #NOTE Add more deps
    pkgs.vulkan-loader
    pkgs.xorg.libX11
    pkgs.x11basic
    pkgs.xorg.libXrandr
    pkgs.xorg.libXcursor
    pkgs.xorg.libXi
    pkgs.libGL
    pkgs.fontconfig
    pkgs.wayland
    pkgs.libxkbcommon
  ];
  libraryPath = pkgs.lib.makeLibraryPath deps;
in pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.clang
    pkgs.lld # To use lld linker
  ];
  buildInputs = deps;
  shellHook = ''
    export WINIT_UNIX_BACKEND="x11"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${libraryPath}"'';
  RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
  #LD_LIBRARY_PATH=nixpkgs.lib.makeLibraryPath buildInputs;
}
