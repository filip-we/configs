sep_char=\|

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" | "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}%   asdf  {%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[yellow]%}%{ stgd●%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ !%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{ +%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[blue]%}%{ -%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{ …%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{ ⚑%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}dirty●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{ clean●%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR="->"

PROMPT='%(?,,%{$fg[red]%}Command failed with exit code $?!%{$reset_color%})
%{$fg[green]%}%*%{$reset_color%} $sep_char %{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} $sep_char %{$fg[blue]%}%~%{$reset_color%}
%{$fg[magenta]%}$(virtualenv_prompt_info)%{$reset_color%}%{$fg[green]%}>%{$reset_color%}'

RPROMPT='%{$reset_color%}$(git_prompt_info)%{$reset_color%}'
