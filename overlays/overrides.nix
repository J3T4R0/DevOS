channels: final: prev: {

  __dontExport = true; # overrides clutter up actual creations

  inherit (channels.latest)
    cachix
    dhall
    discord
    element-desktop
    manix
    nixpkgs-fmt
    qutebrowser
    signal-desktop
    starship;

}
