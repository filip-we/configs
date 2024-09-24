# An highly informative and adaptive prompt that displays all you need on one line.
# NOTE: This prompt uses the plugins git-promt and virtualenv.

local clock='%{$fg[green]%}%*%{$reset_color%}'
local usr_and_host='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local git_branch='%{$(git_super_status)%}%{$reset_color%}'
local error_msg='%(?,, |%{$fg[red]%} ⚠ $?%{$reset_color%})'
local venv_prompt='%{$fg[magenta]%}$(virtualenv_prompt_info)%{$reset_color%}'

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

ZSH_THEME_VIRTUALENV_PREFIX="%{$reset_color%} | %{$fg[magenta]%}("
ZSH_THEME_VIRTUALENV_SUFFIX=")"

RPROMPT=""
PROMPT="${clock} | ${usr_and_host} | ${current_dir}${git_branch}${venv_prompt}${error_msg}
%{$fg[green]%}>%{$reset_color%}"
