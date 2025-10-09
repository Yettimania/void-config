# Aliases
alias e = hx
alias cat = bat

$env.config = {
  show_banner: false,
  edit_mode: "vi"
}

# Scripts path
$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join 'scripts')
]

# Initialize starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Initialize zoxide
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
