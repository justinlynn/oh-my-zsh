function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

PROMPT='%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[white]%}%m%{$reset_color%} : %{$fg_bold[white]%}$(collapse_pwd)%{$reset_color%}
%{$fg_bold[red]%}$(prompt_char) ➜ %{$reset_color%}'

RPROMPT='$(git_prompt_info) %{$fg[blue]%}$(rvm_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[blue]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fb[blue]%} %{$fg[green]%}✓%{$reset_color%}"
