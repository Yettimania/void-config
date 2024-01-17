function display-select --description 'Select separate monitor'
    set choice (printf "dualmonitor\\nportable\\nlaptop\\nclamshell\\nauto" | rofi -dmenu -p "Select display:")

    switch $choice
        case 'dualmonitor'
            xrandr --output DP1 --mode 3840x2160 --scale 0.7x0.7 --left-of eDP1
            feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png
            notify-send "Dual Monitor"
        case 'portable'
            # xrandr --output ${MONITORS[2]} --mode 1920x1080 --scale 0.7x0.7 --left-of ${MONITORS[1]}
            # feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png
            notify-send "Portable"
        case 'laptop'
            xrandr --output DP1 --off
            xrandr --output eDP1 --auto
            feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png
            notify-send "Laptop"
        case 'clamshell'
            xrandr --output DP1 --mode 3840x2160 --output eDP1 --off
            feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png
            notify-send "Clamshell"
        case 'auto'
            xrandr --auto
            notify-send "Auto"
    end
end
