function encrypt --description 'Encrypt file'
    set f $(path change-extension '' $argv[1])
    set recipient $(echo $PERSONAL_EMAIL)
    command gpg --output $f.gpg --encrypt --recipient $recipient $argv[1]
end
