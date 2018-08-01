function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

#±
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "%{$fg_bold[red]%}∘" && return
    echo "%{$fg[cyan]%}∘"
}

function precmd {
    print -Pn ${ZSH_THEME_JUSTINLYNN_PRECMD_OUTPUT_PREFIX}${ZSH_THEME_JUSTINLYNN_PRECMD_OUTPUT}
    ZSH_THEME_JUSTINLYNN_PRECMD_OUTPUT_PREFIX=''
}

# ∷ℾ⧴ 
function preexec {
    ZSH_THEME_JUSTINLYNN_PRECMD_OUTPUT='%{${fg[blue]}%}%{${fg[cyan]}%}⦠ %{${fg[blue]}%}${?}%{${reset_color}%}\n'
    ZSH_THEME_JUSTINLYNN_PRECMD_OUTPUT_PREFIX='%{%{$fg[blue]%}🢑%{${reset_color}%}\n'
    print -P '%{${reset_color}%}%{${fg[cyan]}%}⧴  %{${fg[blue]}%}${3}\n%{${fg[blue]}%}🢓%{${reset_color}%}'
}

PROMPT='%{$fg[cyan]%}%m%{$reset_color%}%{${fg[blue]}%} 🢒 %{$reset_color%}%{$fg[blue]%}%n%{$reset_color%} %{$fg[blue]%}🢖%{${reset_color}%} %{$fg[white]%}$(collapse_pwd)%{$reset_color%}
$(prompt_char)%{${reset_color}%}%{$fg[cyan]%}⊦ %{$reset_color%}%{$fg_bold[white]%}'

RPROMPT='$(git_prompt_info) $(rvm_prompt_info)'

ZSH_THEME_RVM_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_RVM_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg[blue]}%} ∘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"
zle_highlight=(default:bold)
