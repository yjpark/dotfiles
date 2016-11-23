{
  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
    enablePepperPDF = true;
  };

  packageOverrides = pkgs_: with pkgs_; {
    _browsers = with pkgs; buildEnv {
      name = "_browsers";
      paths = [
        firefox
        chromium
      ];
    };
  };}
