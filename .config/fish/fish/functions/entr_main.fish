function entr_main --description 'Run entr for main.py'.
    ls $argv[1] | entr -pc python $argv[1]
end
