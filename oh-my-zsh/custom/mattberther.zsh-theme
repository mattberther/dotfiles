local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}|"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}| %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$terminfo[bold]$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$terminfo[bold]$fg[green]%}?%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$terminfo[bold]$fg[green]%}✓%{$reset_color%}"

#%{$fg[yellow]%}${ruby_version}\
PROMPT="
%{$fg[magenta]%}%n \
%{$terminfo[bold]$fg[green]%}in %{$reset_color%}\
%{$fg[green]%}${current_dir}
%{$fg[cyan]%}${prompt_char}\
${git_info}\
%{$fg[green]%}→ %{$reset_color%}"
