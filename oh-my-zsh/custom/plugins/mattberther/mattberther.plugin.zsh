c() { cd ~/src/$1; }
_c() { _files -W ~/src -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

function gi() { curl http://gitignore.io/api/$@ ;}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '⚡' && return
    echo ''
}

function _update_ruby_version()
{
    typeset -g ruby_version=''
    if which rbenv &> /dev/null; then
      ruby_version="|ruby $(rbenv version-name)| "
    fi
}

chpwd_functions+=(_update_ruby_version)

_update_ruby_version
