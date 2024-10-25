{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  history.size = 10000;
  initExtra = ''
    eval "$(starship init zsh)"
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [
      "git" "web-search" "docker"
    ];
  };
}
