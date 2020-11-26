{
  description = "Searchwing boat recognition";
  ## Run `nix dev-shell`
  ## It provides all dependencies needed to run the commands described in `Readme.md`

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      let
        required-python-packages = python-packages: with python-packages; [
          ipython
          opencv3
          matplotlib
        ];
        python-with-required-packages = python3.withPackages required-python-packages;
      in
        mkShell {
          nativeBuildInputs = [ python-with-required-packages ];
        };
  };
}
