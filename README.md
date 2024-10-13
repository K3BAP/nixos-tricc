# Installation Guide
Please read the complete guide once before proceeding!
## Step 1: Install NixOS on the machine
1. Download the latest NixOS installer image from [nixos.org](https://nixos.org/download/). I used the image with KDE Plasma, but all others should also work.
2. Create a bootable USB drive using the image. For the USB creation you can use for example [Rufus](https://rufus.ie) on Windows or the `dd` command on Unix-like operating systems. Alternatively the cross-platform solution [Balena Etcher](https://etcher.balena.io) can be used.
3. On Windows machines with BitLocker encryption enabled it is necessary to shrink the windows partition **inside Windows using the disk manager** before the installation of a dual boot configuration can be performed. Make sure to provide at least 70 GB of free disk space.
4. Boot the machine from the created USB stick, establish an internet connection and follow the installation wizard.
5. Make sure to select the desired system language and keyboard layout.
6. When creating the user, set `tricc` as user name, choose an easily memorable password (i.e. "tricc24") and enable auto-login. Set an appropriate root password and remind it later.
7. When asked for the desktop environment to be installed, I recommend choosing *Cinnamon* for best performance and usability, especially for people who are not familiar with Linux systems.
8. Enable un-free software sources.
9. At the partitioning stage, make sure to provide at least 70 GB of disk space. In case of a dual boot installation, manual partitioning might be neccessary. Just create a *single ext4 root partition* with all available free disk space and continue. If less than 16GB of RAM is available, a *SWAP partition* might also be helpful.
10. Check the installation summary and, if all looks correct, continue. After the installation, reboot and the standard user should be logged in automatically.

## Step 2: Remove sudo privileges
1. Open a terminal window and switch to the root user using `su` and the root password set earlier.
2. Edit the configuration file `/etc/nixos/configuration.nix` with nano. If you prefer another editor, you can create a nix-shell i.e. `nix-shell -p vim`.
3. Search for the user configuration, which should look like `users.users.tricc = ...`. Here, remove the `wheel` group from the `extraGroups` list:
```
  users.users.tricc = {
    isNormalUser = true;
    description = "Trier Coding Contest";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
```
4. Rebuild NixOS using `nixos-rebuild switch` and remove old builds by running `nix-collect-garbage -d`. Reboot. Now the user has no way of getting sudo privileges on the machine.

## Step 3: Update system packages
At all times, the system packages can be upgraded by using `nixos-rebuild switch --upgrade` as root. To also remove the old NixOS builds from the system, saving disk space, run `nix-collect-garbage -d` as root. 

## Step 4: Clone this repository onto the system
1. Open a terminal window and switch to the root user using `su` and the root password set earlier.
3. Navigate to the NixOS configuration directory by using `cd /etc/nixos`.
4. Open a nix-shell with the git package installed using `nix-shell -p git`. Now git should be accessible.
5. Clone this repository into the `/etc/nixos` directory.

## Step 5: Apply the TriCC configuration
1. Open a terminal window and switch to the root user using `su` and the root password set earlier.
2. Edit the NixOS configuration file, i.e. using `nano /etc/nixos/configuration.nix`.
3. In the imports list, add a new line: 
```
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos-tricc/tricc.nix
    ];
```
4. Save the file and rebuild NixOS using `nixos-rebuild switch` and remove old builds by running `nix-collect-garbage -d`. Now the applications specified in `tricc-applications.nix` are installed and the DNS overrides configured in `tricc-firewall.nix` are applied.
