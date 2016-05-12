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
${hg_info}\
${git_info}\
%{$fg[green]%}→ %{$reset_color%}"

# HG info
local hg_info='$(hg_prompt_info)'
hg_prompt_info() {
  # make sure this is a hg dir
  if [ -d '.hg' ]; then
    echo -n "${ZSH_THEME_GIT_PROMPT_PREFIX}"
    echo -n $(hg branch 2>/dev/null)
    if [ -n "$(hg status 2>/dev/null)" ]; then
      echo -n "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
      echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
    echo -n "$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}