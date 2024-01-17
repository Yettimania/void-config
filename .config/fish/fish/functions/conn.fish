function conn --description 'Shortcut connect wifi'
    command nmcli device wifi connect $argv
end
