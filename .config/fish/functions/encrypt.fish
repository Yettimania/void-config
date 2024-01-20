function encrypt --description 'Encrypt file'
    if test -f $argv[1]
        set input $argv[1]
        set isFile true
        set f $(path change-extension '' $argv[1])
    else
        set tar_output $argv[1].tar.gz
        tar -zcf $tar_output $argv[1]
        set input $tar_output
        set isFile false
        set f $tar_output 
    end

    set recipient $(echo $PERSONAL_EMAIL)
    command gpg --output $f.gpg --encrypt --recipient $recipient $input
    while true

        read -l -P 'Do you want to delete input? [y/N] ' confirm

        switch $confirm
          case Y y
            if test isFile = true
                rm $argv[1]
            else
                rm -rf $argv[1]
            end
            return 0
          case '' N n
            return 1
        end
    end
end
