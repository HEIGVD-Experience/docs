{
  description = "A Nix-flake-based Node.js development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs {
          inherit system;
          #crossSystem = { config = "arm-unknown-linux-gnueabi"; };
          config = {
            #allowUnsupportedSystem = true;
          };
        };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            qemu

            gcc-arm-embedded-10
            cmake
            gnumake
            git

            gdb

            ubootTools
            dtc
            bridge-utils
            #busybox
            util-linux
            dnsmasq
          ];

          shellHook = ''
          '';
          CMAKE_CROSSCOMPILING = true;
        };
      });
    };
}