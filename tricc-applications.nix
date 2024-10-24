{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.git
    vim
    pkgs.gcc
    pkgs.python3
    pkgs.jdk
    pkgs.vscode
    pkgs.jetbrains.idea-community
    pkgs.jetbrains.clion
    pkgs.jetbrains.pycharm-community
  ];
}
