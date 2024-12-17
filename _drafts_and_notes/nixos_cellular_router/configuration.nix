# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "evolve3nix1"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.colin = {
    isNormalUser = true;
    description = "colin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     curl
     htop     
	ethtool             # manage NIC settings (offload, NIC feeatures, ...)
	  tcpdump             # view network traffic
	  conntrack-tools     # view network connection states
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;

  # router bullshit
  boot.kernel = {
    sysctl = {
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv6.conf.all.forwarding" = true;

      # source: https://github.com/mdlayher/homelab/blob/master/nixos/routnerr-2/configuration.nix#L52
      # By default, not automatically configure any IPv6 addresses.
      "net.ipv6.conf.all.accept_ra" = 0;
      "net.ipv6.conf.all.autoconf" = 0;
      "net.ipv6.conf.all.use_tempaddr" = 0;

      # On WAN, allow IPv6 autoconfiguration and tempory address use.
      "net.ipv6.conf.wwp0s21f0u3i4.accept_ra" = 2;
      "net.ipv6.conf.wwp0s21f0u3i4.autoconf" = 1;
   };
  };
  networking = {
    interfaces = {
      enp0s21f0u5 = {
        useDHCP = false;
        ipv4.addresses = [{
          address = "10.201.1.1";
          prefixLength = 24;
        }];
      };
      wwp0s21f0u3i4.useDHCP = true;
    };
    # nixos iptables firewall
    firewall.enable = true;
    nat = {
      enable = true;
      internalInterfaces = [ "enp0s21f0u5" ];
      externalInterface = "wwp0s21f0u3i4";
      enableIPv6 = true;
      # internalIPv6s = [ "2001:db8::/64" ];
    };
    # use netfilter firewall
    nftables = {
      enable = true;
      # ruleset = ''
      #   table inet filter {
      #     #flowtable f {
      #     #  hook ingress priority 0;
      #     #  devices = { wwp0s21f0u3i4, enp0s21f0u5 };
      #     #}
      #     chain output {
      #       type filter hook output priority 100; policy accept;
      #     }
      #     chain input {
      #       type filter hook input priority filter; policy drop;

      #       # Allow trusted networks to access the router
      #       iifname {
      #         "enp0s21f0u5",
      #       } counter accept
  
      #       # Allow returning traffic from ppp0 and drop everthing else
      #       iifname "wwp0s21f0u3i4" ct state { established, related } counter accept
      #       iifname "wwp0s21f0u3i4" drop
      #     }

      #     chain forward {
      #       type filter hook forward priority filter; policy drop;
  
      #       # enable flow offloading for better throughput
      #       # ip protocol { tcp, udp } flow offload @f
  
      #       # Allow trusted network WAN access
      #       iifname {
      #               "enp0s21f0u5",
      #       } oifname {
      #               "wwp0s21f0u3i4",
      #       } counter accept comment "Allow trusted LAN to WAN"

      #       # Allow established WAN to return
      #       iifname {
      #               "wwp0s21f0u3i4",
      #       } oifname {
      #               "enp0s21f0u5",
      #       } ct state established,related counter accept comment "Allow established back to LANs"
      #     }
      #   }
      #   table ip nat {
      #       chain prerouting {
      #         type nat hook prerouting priority filter; policy accept;
      #       }

      #       chain POSTROUTING {
      #   	type nat hook postrouting priority filter; policy accept;
      #     	oifname enp0s21f0u5 masquerade
      #       }
      #     }
      # '';
    };
  };
  services.dnsmasq = {
    enable = true;
    alwaysKeepRunning = true;
    settings = {
      domain-needed = true;
      bind-dynamic = true;
      interface = [ "enp0s21f0u5" ];
      dhcp-range = [ "10.201.1.2,10.201.1.253,255.255.255.0,24h" ];
#      dhcp-option = [
#	"3,0.0.0.0"
#	"6,0.0.0.0"
#        "121,10.201.1.0/24,10.201.1.1"
#      ];
    };
  };
  services.kea.dhcp4 = {
    enable = false;
    settings = {
      interfaces-config = {
        interfaces = [
	  "enp0s21f0u5"
        ];
      };
      lease-database = {
        name = "/var/lib/kea/dhcp4.leases";
        persist = true;
        type = "memfile";
      };
      rebind-timer = 2000;
      renew-timer = 1000;
      subnet4 = [
        {
          pools = [
            {
              pool = "10.201.1.2 - 10.201.1.253";
            }
          ];
          subnet = "10.201.1.0/24";
        }
      ];
      valid-lifetime = 4000;
    };
  };
  networking.firewall.interfaces.enp0s21f0u5 = {
    allowedTCPPorts = [
      # dnsmasq; dns-over-http
      53
    ];
    allowedUDPPorts = [
      # dnsmasq; dns dhcp
      53 67
    ];
  };
}
