{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    pkgs.libgccjit
    pkgs.jdk
    pkgs.vscode
    pkgs.jetbrains.idea-community
    pkgs.jetbrains.clion
    pkgs.jetbrains.pycharm-community
  ];
}
