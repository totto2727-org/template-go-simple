{ buildGoModule, lib }:

buildGoModule {
  pname = "project";
  version = "0.1.0";

  src = lib.cleanSource ./.;
  vendorHash = null;

  meta = {
    description = "A simple Go command-line application";
    license = lib.licenses.mit;
    mainProgram = "project";
    platforms = lib.platforms.unix;
  };
}
