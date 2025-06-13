{
  description = "A Nix-flake for building WPILib";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSupportedSystem = f: inputs.nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import inputs.nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell.override
          {
            # Override stdenv in order to change compiler:
            # stdenv = pkgs.clangStdenv;
          }
          {
            packages = with pkgs; [
              libgcc
              gfortran
            ];
            buildInputs = with pkgs; [
              openjdk17-bootstrap
            ];
            nativeBuildInputs = with pkgs; [
              xorg.libX11
              xorg.libXcursor
              xorg.libXrandr
              xorg.libXinerama
              xorg.libXi
              libGL
            ];
            hardeningDisable = [ "fortify" ];
          };
      });
    };
}
