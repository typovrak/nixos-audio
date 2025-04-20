# nixos-audio

nixos-audio = fetchGit {
    url = "https://github.com/typovrak/nixos-audio.git";
    ref = "main";
};

(import "${nixos-audio}/configuration.nix")
