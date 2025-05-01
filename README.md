# 🔊 NixOS Audio

> Declarative NixOS module to configure a modern PipeWire-based audio stack with WirePlumber, ALSA support, real-time scheduling and helper tools.

## 📦 Features

- 🎵 **PipeWire audio :** Enables ```pipewire```, ```wireplumber```, ALSA compatibility (including 32-bit) and PulseAudio emulation.

- 🔊 **CLI mixer :** Installs ```pamixer``` for scripting and terminal volume control.

- 🎛️ **Modular routing :** Includes ```helvum``` for graphical patchbay management.

- 🛡️ **Real-time priority :** Activates ```rtkit``` to grant real-time scheduling to audio threads.

- ❌ **PulseAudio disabled :** Ensures no conflict with legacy PulseAudio service.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-audio = fetchGit {
    url = "https://github.com/typovrak/nixos-audio.git";
    ref = "main";
    rev = "689a7ccd5c25455f61d02636daab938bb68e4aa2"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-audio}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

See your volume level
```bash
pamixer --get-volume
```

Toggle mute audio with
```bash
pamixer --toggle-mute
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
