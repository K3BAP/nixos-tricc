{ config, ... }:

{
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    extraConfig = ''
      address=/#/0.0.0.0

      server=/salesch.uni-trier.de/8.8.8.8
      server=/algo.uni-trier.de/8.8.8.8
      server=/www.uni-trier.de/8.8.8.8
      server=/cppreference.com/8.8.8.8
      server=/jetbrains.com/8.8.8.8

      server=/cache.nixos.org/8.8.8.8
    '';
  };

  networking.resolvconf.useLocalResolver = true;
}
