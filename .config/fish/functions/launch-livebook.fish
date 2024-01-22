function launch-livebook --description 'Launch Livebook Server'
    cd ~/git/livebook
    mix phx.server
    firefox http://localhost:4000
end
