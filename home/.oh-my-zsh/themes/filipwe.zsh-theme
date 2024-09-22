# NOTE: This prompt uses the plugins git-promt and virtualenv.
# Highly informative Git-info on the first line of your prompt.

local clock='%{$fg[green]%}%*%{$reset_color%}'
local usr_and_host='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local git_branch='%{$(git_super_status)%}%{$reset_color%}'
local error_msg='%(?,,|%{$fg[red]%} ⚠ $?%{$reset_color%})'

ZSH_THEME_GIT_PROMPT_PREFIX=" | "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" | "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[cyan]%}⋌ "
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[yellow]%}%{⚫︎%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{⚠ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%{ ±%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}%{ -%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{ ↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{ ↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}%{ ⊘︎ %G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[magenta]%}%{ ⊞ %G%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚫︎%G"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{⚫︎%G%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR="->"

RPROMPT=""
PROMPT="${clock} | ${usr_and_host} | ${current_dir} ${git_branch} ${error_msg}
%{$fg[magenta]%}$(virtualenv_prompt_info)%{$reset_color%}%{$fg[green]%}>%{$reset_color%}"
