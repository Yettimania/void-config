function void --description 'Void configuration for /home directory'
    command /usr/bin/git --git-dir=$HOME/.void/ --work-tree=$HOME $argv
end
