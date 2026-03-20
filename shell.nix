{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = [
    (pkgs.sbcl.withPackages (ps: [ ps.qlot-cli ps.dbi ]))
    #pkgs.sbclPackages.qlot-cli
  ];
}
