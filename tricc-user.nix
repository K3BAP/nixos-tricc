{ config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tricc24 = {
    isNormalUser = true;
    description = "Trier Coding Contest 2024";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "tricc24";
}