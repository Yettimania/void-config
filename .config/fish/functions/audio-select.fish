function audio-select --description 'Set output for Audio Device'
    set choice (printf "dock\\nbuilt-in" | rofi -dmenu -p "Select audio output")

    switch $choice
        case 'dock'
            wpctl set-default 47
            notify-send "dock"
        case 'built-in'
            wpctl set-default 49
            notify-send "built-in"
    end
end
