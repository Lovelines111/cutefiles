		{ inputs, config, pkgs, nixos2405, ... }:

{
  # Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

	imports = [
		./pk2home.nix
	];

  home = {
    username = "luvelyne";
    homeDirectory = "/home/luvelyne";

    packages = with pkgs; [

			# Flake inputs
			#inputs.lobster.packages."x86_64-linux".lobster #This is broken because of the API limit but hopefully it will be fixed one day.
			#inputs.telescope.packages."x86_64-linux".default
			#inputs.envision.packages."x86_64-l inux".default

			# Packages
			rawtherapee
			gnucash
			android-tools
			anbox
			ani-cli
			any-nix-shell
			audacity
			bat # A cat clone with syntax highlighting and Git integration.
			bitwarden
			blahaj
			bookworm
			cargo # Manage Rust projects and their module dependencies (crates).
			cbonsai
			chromium
			clisp
			clojure
			cmatrix
			conda
			coolreader
			cowsay
			cups
			curl
			cwiid
			deluge
			discordo
			emacs
			extremetuxracer
			figlet
			freedroidrpg
			hugo # A fast and modern static website engine.
			jdk
			foliate
			leiningen
			libnotify
			#librewolf
			inputs.nixos2405.legacyPackages.x86_64-linux.librewolf
			inputs.nixos2405.legacyPackages.x86_64-linux.librewolf-unwrapped
			lukesmithxyz-bible-kjv
			micro
			minetest
			mov-cli
			ncdu # A disk usage analyzer with an interactive interface.
			nchat # Terminal-based chat client with support for Telegram and WhatsApp
			neovim
			nheko
			nicotine-plus # Sovlseek
			obs-studio
			pacvim
			prismlauncher
			porsmo # Pomodoro written in Rust.
			qemu
			retroshare
			sbcl # LISP compiler
			scanmem
			sl
			#stardust # Space flight simulator.
			signal-desktop
			superTux
			superTuxKart
			speedtest-go
			telegram-desktop
			tetrio-desktop
			termdown # Countdown cli program.
			tomato-c # Pomodoro written in pure C.
			#toybox
			tgpt
			vimb
			vimgolf
			vim-full
			vitetris
			vlc
			kdePackages.kdeconnect-kde
			hollywood
			waydroid
			waylyrics
			webcord-vencord
			wipeout-rewrite
			wl-clipboard # Command-line copy/paste utilities for Wayland.
			xwiimote
			yt-dlp
			# # # Newly added:
			blanket # play background sounds
			bleachbit # program to clean computer
			dissent # GTK4 Discord client in Go
			iperf # tool to measure IP bandwidth using UDP or TCP
			mtr-gui # network diagnostics tool
			remmina # remote desktop client
			shellcheck # shell script analysis tool
			shortwave # find and listen to internet radio stations
			tcpdump # network sniffer
			trashy # simple, fast, and featureful alternative to rm and trash-cli
			tuba # browse the Fediverse
			rPackages.VedicDateTime
			iotop
			theharvester
			# # # Pentesting
			# 802-11
			aircrack-ng # wireless WEP/WPA cracking utilities
			bully # Implementation of the WPS brute force attack, written in C
			cowpatty # Brute-force WPA dictionary attack
			hashcat # World's fastest and most advanced password recovery utility
			iw # tool for configuring Linux wireless devices
			macchanger # utility for manipulating the MAC address of network interfaces	
			pixiewps # Offline WPS bruteforce tool
			reaverwps-t6x # brute force attack tool against Wifi Protected Setup PIN number
			wifite2 # Python script to automate wireless auditing using aircrack-ng tools
			#wordlists # collection of wordlists useful for security testing
			gparted
			dnsmasq #for downloads
			#pkgs.nvidia-podman
			pkgs.krita
			pkgs.wineWowPackages.waylandFull
			ninja
			meson
			nodejs
			pkg-config
			cmake
			wofi
			cpupower-gui
			droidcam
			friture
			exfat
			blanket
			zoom-us
			gnome.gnome-boxes
			qemu
			gimp-with-plugins
			lolcat
			eolie
			proxychains-ng
			tsocks
			linux-wallpaperengine
			openresolv
			xray
			freeimage
			unzip
			brave
			stow
			ocs-url
			extra-cmake-modules
		];

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.
  };
	nixpkgs.config.allowUnfreePredicate = _: true;

	nixpkgs.config.permittedInsecurePackages = [
	"freeimage-unstable-2021-11-01"
	];
	programs.git.enable = true;
	programs.starship.enable = true;
	programs.fzf.enable = true;
	
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		enableVteIntegration = true;
		shellAliases = {
			run-with-xwayland = "env -u WAYLAND_DISPLAY";
		};

		# Install plugins
		plugins = [

			# Vi keybindings
			{
				name = "zsh-vi-mode";
				file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
				src = pkgs.zsh-vi-mode;
			}

			# Autosuggestions
			{
				name = "zsh-autosuggestions";
				file = "./share/zsh-autosuggestions/zsh-autosuggestions.zsh";
				src = pkgs.zsh-autosuggestions;
			}
		];
	};
	# Configure kitty terminal
	programs.kitty = {

		# Enable kitty
		enable = true;

		# Configure font
		font = {
			name = "FiraCode Nerd Font";
			size = 12;
			};
		# Glitter
		#theme = "Alucard";
# 		settings = {
# 			include = "/home/luvelyne/Base2Tone-kitty/themes/base2tone-suburb-dark.conf";
# 		};
	};

  # Magnificent app that corrects your previous console command, integrates with zsh.
	programs.thefuck.enable = true;

  # Enable zoxide
	programs.zoxide.enable = true;


# 	programs.rofi = {
# 		package = pkgs.rofi-wayland;
# 		enable = true;
# 		theme = "/home/luvelyne/rofi-themes/*";
# 		font= "FiraCode";
# 		terminal = "\${pkgs.wezterm}/bin/wezterm";
# 		location = "center";
# 	};

	# Configure Visual Studio Code
	programs.vscode = {

		# Enable VS Code
		enable = true;

		# Install extensions
		extensions = with pkgs.vscode-extensions; [

			# Utility
			ms-vsliveshare.vsliveshare
			shardulm94.trailing-spaces
			vscodevim.vim
			xaver.clang-format

			# Languages
			bbenoist.nix
			haskell.haskell
			ms-vscode.cpptools
			ms-dotnettools.csharp
			yzhang.markdown-all-in-one
		];
	};

	# Add config file for VS Code
	xdg.configFile."Code/User/settings.json" = {
		text = ''
			{
				"editor.fontFamily": "'FiraCode Nerd Font', monospace",
				"editor.tabSize": 2,
				"editor.wordWrap": "wordWrapColumn",
				"explorer.confirmDelete": false,
				"git.confirmSync": false,
				"window.menuBarVisibility": "toggle",
				"window.zoomLevel": 1,
				"workbench.startupEditor": "none",
			}
		'';
	};
	 programs.mangohud = {
      enable = true;
      enableSessionWide = true;
      settings = {
        full = true;
        no_display = false;
        cpu_load_change = true;
        cpu_mhz = true;
        cpu_power = true;
		gpu_power = true;
		cpu_temp = true;
		gpu_temp = true;
		gamemode = true;

      };
	};
		programs.wezterm = {
			enable = true;
		extraConfig = ''
		return {
			font = wezterm.font "FiraCode Nerd Font",
			font_size = 14.0,
			hide_tab_bar_if_only_one_tab = true,
			color_scheme = "Tokyo Night",
			use_fancy_tab_bar = false,
		}
		'';
		};

	services.flameshot = {
        enable = true;
	};

	programs.fuzzel = {
	enable = true;
	settings = {
		main.width = 70;

		colors = {
			#background = "fe53e04f";
			background = "c13effff";
			text = "000000ff";
			#match = "6d00ffcc";
			match = "72077dff";
			selection = "72077dff";
			selection-text = "f52891cc";
			selection-match = "ff0084ff";

		};
	};};


}
