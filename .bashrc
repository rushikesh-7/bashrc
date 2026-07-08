#!/usr/bin/env bash

unset SSH_ASKPASS

## ----------------------------------------------------------------
## general linux
## ----------------------------------------------------------------
export LANGUAGE=C.UTF-8
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
# export LC_CTYPE=en_DE.UTF-8

alias ..='cd ..'
alias l='ls -al -h --color=auto'
alias lt='ls -ltr -h --color=auto'
alias du='du -sh $1'
alias cl='clear'
alias cls='clear && ls'
alias rl='readlink -f'
alias desk='vncserver -geometry 1680x1050'
alias cleanall='rm -rf Residual* memrep_geom.txt m_log out/*'
alias cleansol='find out/ -type f ! -name "grid.Netcdf" -exec rm -f {} +'
alias grepi='grep -inr '
alias grept='grep -inr --include=*.toml '
alias vimbash='nv $HOME/.bashrc'
alias loadbash='source $HOME/.bashrc'
alias cdc='cd /aia/r022/scratch/rushikesh/RushiCases'
alias cds='cd /aia/r022/scratch/rushikesh'
alias cdh='cd /aia/r022/scratch/rushikesh/HLRSCases'
alias cdA='cd /aia/r022/scratch/rushikesh/HLRSCases/tripping/TE0.00045687/trip_h0.00119947_bothSide'
alias cdB='cd /aia/r022/scratch/rushikesh/HLRSCases/riblets/h0.00119947_trapz_s+80_alp45_bs0.5_hs0.5_top'
alias cdC='cd /aia/r022/scratch/rushikesh/HLRSCases/riblets/h0.00119947_trapz_s+40_alp45_bs0.5_hs0.5_top'
alias cdD='cd /aia/r022/scratch/rushikesh/HLRSCases/riblets/h0.0008996025_trapz_s+80_alp45_bs0.5_hs0.5_top'
alias cdt='cd /aia/r022/scratch/rushikesh/TestCases'
alias cdm='cd $HOME/Desktop/master_maia/Solver'
alias cpwd='pwd | xclip -selection clipboard'
alias ncd='ncdump -h '
alias cclip='xclip -selection clipboard'
alias copyfile='xclip -selection clipboard -in <'
alias findfile='find . -type f -name '
alias finddir='find . -type d -name '
alias ok='okular '
alias gmsh='/aia/r022/scratch/rushikesh/Software/gmsh-4.12.2-Linux64/bin/gmsh'
alias vsserver='$HOME/Downloads/vscode_server/code tunnel'
alias xfoil='$HOME/Desktop/Xfoil/bin/xfoil'
alias vs='$HOME/Downloads/VSCode-linux-x64/bin/code'
alias notify='kdialog --passivepopup "Command finished with exit code: $?" 5 --title "Task Complete"'

alias plot2d='python $HOME/scripts/tools/post/plot_2d.py'
alias plot='python $HOME/scripts/tools/post/plot.py'
alias roofline='python $HOME/scripts/tools/post/roofline.py'

alias gst='git status'
alias gd='git diff'
alias gaall='git add --all'
alias ga='git add --all'
alias gl='git log'
alias gcm='git commit'
alias gwt='git worktree'
alias gco='git checkout'

alias tls='tmux ls'
alias tat='tmux attach -t $1'
alias tatl='tmux attach'

alias nv='$HOME/nvim-linux-x86_64/bin/nvim'

hpsend(){
  scp $1 hp@134.61.164.197:$2
}

hpcopy(){
  scp hp@134.61.164.197:$1 $2
}

## ----------------------------------------------------------------
## Special Formatting Aliases
## ----------------------------------------------------------------

# Ensure clang formatting in code
alias formatup='git diff `git merge-base --fork-point remotes/upstream/master` -U0 | /pds/opt/llvm/share/clang/clang-format-diff.py -p1 -regex ".*\.(h|cpp)" -i'
alias formatupsave='git diff `git merge-base --fork-point remotes/upstream/master` -U0 | /pds/opt/llvm/share/clang/clang-format-diff.py -p1 -regex ".*\.(h|cpp)" > format.txt'
alias formatorg='git diff `git merge-base --fork-point remotes/origin/master` -U0 | /pds/opt/llvm/share/clang/clang-format-diff.py -p1 -regex ".*\.(h|cpp)" -i'
alias formatorgsave='git diff `git merge-base --fork-point remotes/origin/master` -U0 | /pds/opt/llvm/share/clang/clang-format-diff.py -p1 -regex ".*\.(h|cpp)" -i > format.txt'

## ----------------------------------------------------------------
## Prompt
## ----------------------------------------------------------------

nodesTwelve=("aia292" "aia293" "aia294" "aia295" "aia296" "aia297" "aia298" "aia299" "aia300" "aia301" "aia302" "aia303" "aia304" "aia305" "aia306" "aia307")
nodesTwentyfour=("aia308" "aia309" "aia310" "aia311" "aia312" "aia313")
nodesTwentyeight=("aia280" "aia281" "aia314" "aia316" "aia317" "aia318")
nodesForty=("aia260" "aia261" "aia262" "aia263")
nodesFortyEight=("aia331" "aia332" "aia333" "aia336" "aia338" "aia340")
nodesOneTwentyEight=("aia264" "aia265")
nodesQuadro=("aia319" "aia323" "aia324")
nodesRtx=("aia330" "aia321" "aia322" "aia320")

# function setPrompt {
#   local host=$(hostname)
#
#   if [ -n "$SSH_CONNECTION" ] || [[ "$host" =~ ^aia ]]; then
#     if [[ "$host" = "aia315" ]]; then
#       PS1='\[\033[1;32m\]\t|\u@fe1|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ "$host" = "aia258" ]]; then
#       PS1='\[\033[1;32m\]\t|\u@fe2|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ "$host" = "aia259" ]]; then
#       PS1='\[\033[1;32m\]\t|\u@fe3|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ "$host" = "aia257" ]]; then
#       PS1='\[\033[1;32m\]\t|\u@fe4|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesTwelve[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s12|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesTwentyfour[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s24|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesTwentyeight[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s28|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesForty[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s40|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesFortyEight[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s40|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesOneTwentyEight[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@s40|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesQuadro[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@squadro|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     elif [[ " ${nodesRtx[@]} " =~ " $host " ]]; then
#       PS1='\[\033[1;35m\]\t|\u@srtx|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     else
#       PS1='\[\033[1;34m\]\t|\u@\h|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#     fi
#   else
#     PS1='\[\033[1;34m\]\t|\u@\h|\w\[\033[33m\]$(__git_ps1 "(%s)")\n\[\033[0m\]> '
#   fi
# }

# PROMPT_COMMAND=setPrompt

function setStarship {
  local host=$(hostname)
  if [ -n "$SSH_CONNECTION" ] || [[ "$host" =~ ^aia ]]; then
    if [[ "$host" = "aia315" ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_fe1.toml
    elif [[ "$host" = "aia258" ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_fe2.toml
    elif [[ "$host" = "aia259" ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_fe3.toml
    elif [[ "$host" = "aia257" ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_fe4.toml
    elif [[ " ${nodesTwelve[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s12.toml
    elif [[ " ${nodesTwentyfour[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s24.toml
    elif [[ " ${nodesTwentyeight[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s28.toml
    elif [[ " ${nodesForty[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s40.toml
    elif [[ " ${nodesFortyEight[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s48.toml
    elif [[ " ${nodesOneTwentyEight[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_s128.toml
    elif [[ " ${nodesQuadro[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_quadro.toml
    elif [[ " ${nodesRtx[@]} " =~ " $host " ]]; then export STARSHIP_CONFIG=$HOME/.config/starship/starship_rtx.toml
    else
      export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    fi
  else
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
  fi
}

PROMPT_COMMAND=setStarship
eval "$(starship init bash)"

## ----------------------------------------------------------------
## AIA general
## ----------------------------------------------------------------

# start parav in background and silence output (redirected to null output)
alias para='parav >/dev/null 2>&1 &'

#--SSH Logins------------------------------------------------------------------
# login to chosen front end and change into current directory
alias fe1='ssh -X fe1 -t "cd $(pwd); exec $SHELL -l"'
alias fe2='ssh -X fe2 -t "cd $(pwd); exec $SHELL -l"'
alias fe3='ssh -X fe3 -t "cd $(pwd); exec $SHELL -l"'
alias fe4='ssh -X fe4 -t "cd $(pwd); exec $SHELL -l"'

#--Useful Env Vars------------------------------------------------------------------
export NSYS_TRACE_OPTS="--trace=cuda,nvtx,mpi --force-overwrite=true"
export NSYS_CUDA_OPTS="--cuda-memory-usage=true --cuda-um-cpu-page-faults=true --cuda-um-gpu-page-faults=true"
export NSYS_OUT="--output=report.nsys-rep"

export NSYS_COMPUTE="/opt/nvidia/nsight-compute/2025.1.0/ncu-ui"

## ----------------------------------------------------------------
## SSH connections
## ----------------------------------------------------------------

alias sshhp='ssh -X hp@134.61.164.197'

# short forms for interactive session on 12er node
alias si12='si -X 12 1 04:00:00'
alias si24='si -X 24 1 04:00:00'
alias si28='si -X 28 1 04:00:00'
alias si40='si -X 40 1 04:00:00'
alias si48='si -X 48 1 04:00:00'
alias si128='si -X 128 1 04:00:00'
alias siquadro='si -X quadro 1 24:00:00'
alias sirtx='si -X rtx 1 24:00:00'

# No Display - short forms for interactive session on 12er node
alias ndsi12='si 12 1 04:00:00'
alias ndsi24='si 24 1 04:00:00'
alias ndsi28='si 28 1 04:00:00'
alias ndsi40='si 40 1 04:00:00'

alias claix23_1='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-1.hpc.itc.rwth-aachen.de'
alias claix23_2='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-2.hpc.itc.rwth-aachen.de'
alias claix23_3='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-3.hpc.itc.rwth-aachen.de'
alias claix23_4='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-4.hpc.itc.rwth-aachen.de'
alias claix23_g1='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-g-1.hpc.itc.rwth-aachen.de'
alias claix23_g2='ssh -X -i $HOME/.ssh/claix_id_ed25519 vx141040@login23-g-2.hpc.itc.rwth-aachen.de'


alias jureca='ssh -X shende2@jureca.fz-juelich.de'
alias juwels_booster='ssh -X -i $HOME/.ssh/id_julich shende2@juwels-booster.fz-juelich.de'
alias judac='ssh -X -i $HOME/.ssh/id_julich shende2@judac.fz-juelich.de'
## ----------------------------------------------------------------
## HAWK Commands
## ----------------------------------------------------------------

alias hawk='ssh -X xacrushi@hawk.hww.hlrs.de'
alias hawk3='ssh -X xacrushi@hawk-login03.hww.hlrs.de'
alias hawk4='ssh -X xacrushi@hawk-login04.hww.hlrs.de'
alias hawk5='ssh -X xacrushi@hawk-login05.hww.hlrs.de'
alias hunter='ssh -i $HOME/.ssh/hunter_20250729 -X xacrushi@hunter.hww.hlrs.de'
alias hunter3='ssh -i $HOME/.ssh/hunter_20250729 -X xacrushi@hunter-login03.hww.hlrs.de'
alias hunter4='ssh -i $HOME/.ssh/hunter_20250729 -X xacrushi@hunter-login04.hww.hlrs.de'
alias hunter5='ssh -i $HOME/.ssh/hunter_20250729 -X xacrushi@hunter-login05.hww.hlrs.de'
alias hunterssh='ssh -i $HOME/.ssh/hunter_20250729 -X -R localhost:14104 xacrushi@hunter.hww.hlrs.de'
alias vulcan='ssh -i $HOME/.ssh/hunter_20250729 -X xacrushi@vulcan.hww.hlrs.de'
alias huntermount='sshfs xacrushi@hunter.hww.hlrs.de:$1 $2'

# alias hawkgit='ssh -R 8888:git.rwth-aachen.de:22 xacrushi@hawk.hww.hlrs.de'
alias hunterSocks5="bash $HOME/aia_default/scripts/connectToHunterWithSocks5.bash xacrushi 1080"
alias huntersvn='ssh -R 1091:svn:80 xacrushi@hunter.hww.hlrs.de'

# # start a local SOCKS proxy
# alias loopHttps="ssh -N -D 1080 localhost"
# # connect to hawk with intention to use local
# alias hawkHttps="ssh -R 7777:localhost:1080 xacrushi@hawk-login05.hww.hlrs.de"

pullhunter(){
  rsync -av --stats --progress -e "ssh -i $HOME/.ssh/hunter_20250729" xacrushi@hunter.hww.hlrs.de:"$1" "$2"
}
pushhunter(){
  rsync -av --stats --progress -e "ssh -i $HOME/.ssh/hunter_20250729" "$1" xacrushi@hunter.hww.hlrs.de:"$2"
}

pushclaix(){
  rsync -av --stats --progress -e ssh "$1" vx141040@login23-1.hpc.itc.rwth-aachen.de:"$2"

}

pulljsc_booster(){
  rsync -av --stats --progress -e ssh shende2@juwels-booster.fz-juelich.de:"$1" "$2"
}
pushjsc_booster(){
  rsync -av --stats --progress -e ssh "$1" shende2@juwels-booster.fz-juelich.de:"$2"
}

# pullhawk(){
#   rsync -av --stats --progress -e ssh xacrushi@hawk.hww.hlrs.de:"$1" "$2"
# }
# pushhawk(){
#   rsync -av --stats --progress -e ssh "$1" xacrushi@hawk.hww.hlrs.de:"$2"
# }
# parahawk(){
#   export PATH=/pds/opt/ParaView-5.13.2/bin:$PATH
#   pvconnect -pvs $1 -usr xacrushi
# }
paraVulcan(){
  export PATH=/pds/opt/ParaView-5.13.2/bin:$PATH
  pvconnect -pvs $1 -usr xacrushi
}

## ----------------------------------------------------------------
## SLURM commands
## ----------------------------------------------------------------

alias sq="squeue -u rushikesh"
alias sidle='sinfo | grep idle --color=never'
alias sallkill='squeue -u $USER -o "%.18i" | tail -n +2 | xargs -r scancel'
alias slastkill='squeue -u $USER -o "%.18i" | tail -n 1 | xargs -r scancel'

## ----------------------------------------------------------------
## Path directories env vars
## ----------------------------------------------------------------

export TOOLS=$HOME/scripts/tools
export POST=$HOME/scripts/tools/post
export PRE=$HOME/scripts/tools/pre
export SCRATCH=/aia/r022/scratch/rushikesh
export RUSHISOLVER=$HOME/Desktop/mAIA/Solver
export SOLVER=$HOME/Desktop/master_maia/Solver

export R_GNUPROD=$HOME/Desktop/mAIA/Solver/build_gnu_production/bin/maia
export R_GNUDEBUG=$HOME/Desktop/mAIA/Solver/build_gnu_debug/bin/maia
export GNUPROD=$HOME/Desktop/master_maia/Solver/build_gnu_production/bin/maia
export GNUDEBUG=$HOME/Desktop/master_maia/Solver/build_gnu_debug/bin/maia
export NVHPCPROD=$HOME/Desktop/master_maia/Solver/build_nvhpc_production/bin/maia

# Post and Pre script aliases
alias createbox='python $PRE/stl_box.py $1 $2 $3 $4 $5 $6 $7'
alias resmonitor='python $POST/residual_monitor.py -p Residual -n 5 -y 3 4 5 6 7 -rs $1'
alias forcemonitor='python $POST/force_monitor.py -p forceCoef -fs $1'
alias tomldiff='python $PRE/toml_diff.py $1 $2'
alias logdiff='python $POST/log_diff.py'

## ----------------------------------------------------------------
## Python Commands and aliases
## ----------------------------------------------------------------

alias capost='conda activate post'

export PATH=$HOME/local/bin:$PATH

# Created by `userpath` on 2024-07-05 11:47:24
export PATH="$PATH:/aia/r014/home/rushikesh/.local/bin"

## ----------------------------------------------------------------
## Conda
## ----------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/aia/r014/home/rushikesh/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/aia/r014/home/rushikesh/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/aia/r014/home/rushikesh/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/aia/r014/home/rushikesh/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/aia/r014/home/rushikesh/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/aia/r014/home/rushikesh/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

## ----------------------------------------------------------------
## Starship Config
## ----------------------------------------------------------------



## ----------------------------------------------------------------
## Fuzzy Find
## ----------------------------------------------------------------

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

## ----------------------------------------------------------------
## EOF
## ----------------------------------------------------------------

# opencode
export PATH=/home/rushikesh/.opencode/bin:$PATH
