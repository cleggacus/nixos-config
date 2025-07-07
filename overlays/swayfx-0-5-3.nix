final: prev: {
  swayfx-unwrapped = prev.swayfx-unwrapped.overrideAttrs (old: rec {
    version = "0.5.3";
    src = prev.fetchFromGitHub {
      owner = "WillPower3309";
      repo = "swayfx";
      rev = version;
      hash = "sha256-TZNN5pQhH/10DfntCfGHL1kuAceLMYbxwa4RFq7OmrQ="; # replace after build
    };
  });

  swayfx = prev.callPackage (prev.path + "/pkgs/desktops/swayfx") {
    swayfx-unwrapped = final.swayfx-unwrapped;
  };
}
