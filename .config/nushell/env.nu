# Nu env settings
#
# Set environment   
$env.EDITOR = 'hx'
$env.READER = 'zathura'
$env.TERMINAL = 'alacritty'
$env.BROWSER = 'firefox'
$env.VISUAL = 'hx'
$env.TZ = 'American/Los_Angeles'
$env.PAGER = 'less'
$env.GPG_TTY = $"(tty)"

# Prepend scripts path first
$env.PATH = ($env.PATH | split row (char esep) | prepend ($nu.default-config-dir | path join 'scripts'))

# Append paths
$env.PATH = ($env.PATH | append $"($env.HOME)/.local/bin")
$env.PATH = ($env.PATH | append $"($env.HOME)/.cargo/bin")
$env.PATH = ($env.PATH | append $"($env.HOME)/.local/share/zig")
$env.PATH = ($env.PATH | append $"($env.HOME)/.npm-global/bin")
$env.PATH = ($env.PATH | append $"($env.HOME)/.duckdb/cli")
$env.PATH = ($env.PATH | append $"($env.HOME)/.asdf/installs/elixir/1.18.0/.mix/escripts")
$env.PATH = ($env.PATH | append $"($env.HOME)/.local/share/gem/ruby/3.4.0/bin")

