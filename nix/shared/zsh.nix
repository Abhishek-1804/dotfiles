{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  history.size = 10000;
  initContent = ''
      eval "$(starship init bash)"  # For bash
      eval "$(starship init zsh)"   # For zsh
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [
      "git" "web-search" "docker"
    ];
  };
}
