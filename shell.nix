{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = [
    (pkgs.sbcl.withPackages (ps: [ ps.arrow-macros ]))
  ];
}
