{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	environment.systemPackages = with pkgs; [
		pipewire
		wireplumber
		pamixer
		helvum
	];

	services.pipewire = {
		enable = true;
		audio.enable = true;
		pulse.enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		wireplumber.enable = true;
	};

	hardware.pulseaudio.enable = false;

	security.rtkit.enable = true;
}
