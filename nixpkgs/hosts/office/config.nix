{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
    enablePepperPDF = true;
  };

  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        firefox
        chromium
        go
        hugo
        atom
      ];
    };
  };}
