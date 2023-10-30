# Nushell Environment Config File
#
# version = "0.86.0"

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.EDITOR = {|| "nvim" }
$env.DOCKER_HOST = unix://($env.HOME)/.colima/default/docker.sock
$env.LDFLAGS = "-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
$env.CPPFLAGS = "-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

$env.LC_ALL = "en_US.UTF-8"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
$env.PATH = (
    $env.PATH | split row (char esep)
    | prepend $'($env.HOME)/.pyenv/bin'
    | prepend $'($env.HOME)/.local/bin'
    | prepend '/usr/local/opt/ruby/bin'
    | prepend '/usr/local/lib/ruby/gems/2.6.0/bin'
)

if ('~/.config/nushell/secrets.nu' | path exists)  {
	use ~/.config/nushell/secrets.nu
}

zoxide init nushell | save -f ~/.zoxide.nu
