function decrypt --description 'Decrypt file'
    set output $(path change-extension '' $argv[1])
    command gpg --output $output --decrypt $argv[1]
end
