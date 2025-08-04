{ pkgs, lib, username, inputs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = false;
  
  # Allow user to change networkmanager settings
  users.users.${username} = {
    extraGroups = ["networkmanager"];
  };
}
