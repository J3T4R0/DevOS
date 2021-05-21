{ config, pkgs, lib, inputs, ... }:
{
  environment.etc."nix/channels/nixpkgs".source = inputs.nixpkgs.outPath;
  environment.etc."nix/channels/home-manager".source = inputs.home-manager.outPath;
  nix.nixPath = [
    "nixpkgs=/etc/nix/channels/nixpkgs"
    "home-manager=/etc/nix/channels/home-manager"
  ];
}
