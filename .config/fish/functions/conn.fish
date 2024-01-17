function conn --description 'Shortcut connect wifi'
    command wpa_passphrase $argv >> /etc/wpa_supplicant/wpa_supplicant.conf
end
