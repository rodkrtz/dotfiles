alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Inicializa o Starship
starship init fish | source
