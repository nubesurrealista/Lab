{
  description = "Nix environment for building SRB2 AppImage";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = with nixpkgs.legacyPackages.x86_64-linux; [
        gnumake
        git
        debianutils
        coreutils
        findutils
        file
        ncurses
        curl
        gawk
        stow
        fuse
        zlib
        patchelf
        gdk-pixbuf
        flatpak
        flatpak-builder
      ];

      shellHook = ''
        export TERM=xterm
        mkdir -p ~/.local/share
      '';
    };
  };
}
