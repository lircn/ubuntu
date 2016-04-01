# Li Zheng <6007381@qq.com>
# 2016-04-01

# VCS
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# LIR
LIR_PREFIX="%{$fg_bold[blue]%}["
LIR_SUFFIX="%{$fg_bold[blue]%}] - "
HISTORY="$LIR_PREFIX%{$fg_bold[magenta]%}%!$LIR_SUFFIX"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="$LIR_PREFIX%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$LIR_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local exit_code="%(?,%{$fg_bold[red]%}♥ ,%{$fg[red]%}%?)"

PROMPT="
%{$fg_bold[blue]%} - \
$LIR_PREFIX%{$fg_bold[magenta]%}%~$LIR_SUFFIX\
${git_info}\
%{$fg_bold[blue]%}[%{$fg[white]%}%*%{$fg_bold[blue]%}] \
${exit_code}
%{$fg_bold[green]%} ♪ %{$reset_color%}"
