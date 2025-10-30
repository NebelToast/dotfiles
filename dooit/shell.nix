
let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
    buildInputs = [
    pkgs.python3
    pkgs.dooit
    pkgs.dooit-extras
  ];
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.rich
    ]))
  ];
}
