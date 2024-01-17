function config --description 'Root config repo for system'
    command /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
