[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 🔊 NixOS Audio

> Declarative NixOS module to configure a modern PipeWire-based audio stack with WirePlumber, ALSA support, real-time scheduling and helper tools.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🎵 **PipeWire audio :** Enables ```pipewire```, ```wireplumber```, ALSA compatibility (including 32-bit) and PulseAudio emulation.
- 🔊 **CLI mixer :** Installs ```pamixer``` for scripting and terminal volume control.
- 🎛️ **Modular routing :** Includes ```helvum``` for graphical patchbay management.
- 🛡️ **Real-time priority :** Activates ```rtkit``` to grant real-time scheduling to audio threads.
- ❌ **PulseAudio disabled :** Ensures no conflict with legacy PulseAudio service.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix # module configuration
├── LICENSE.md        # MIT license
└── README.md         # this documentation

1 directory, 3 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
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

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-audio = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-audio.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-audio}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-audio.git &&
cd nixos-audio &&
git log -1 --pretty=format:"%H"
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

## 📚 Learn more

- 🔊 [PipeWire documentation](https://pipewire.org) : Learn how PipeWire manages audio and video streams with low latency.
- 🧩 [WirePlumber session manager](https://pipewire.pages.freedesktop.org/wireplumber) : Advanced session and policy management for PipeWire.
- 🎛️ [Helvum patchbay](https://gitlab.freedesktop.org/pipewire/helvum) : Visual tool to route audio between apps and devices.
- 🛠️ [PipeWire on Arch wiki](https://wiki.archlinux.org/title/PipeWire) : Detailed usage, tips and config examples.
- 📦 [pamixer GitHub](https://github.com/cdemoulins/pamixer) : Lightweight CLI mixer compatible with PulseAudio and PipeWire.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
