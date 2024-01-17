function entr_spellcheck --description 'Run entr for spellcheck'.
    ls $argv[1] | entr -p aspell -c /_
end
