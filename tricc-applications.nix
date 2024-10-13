{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.git
    vim
    pkgs.libgccjit
    pkgs.jdk
    pkgs.vscode
    pkgs.jetbrains.idea-community
    pkgs.jetbrains.clion
    pkgs.jetbrains.pycharm-community
  ];
}
