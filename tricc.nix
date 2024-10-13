{ config, pkgs, ... }:

{
  imports =
    [ 
      ./tricc-applications.nix
      ./tricc-firewall.nix
      ./tricc-user.nix
    ];
}
