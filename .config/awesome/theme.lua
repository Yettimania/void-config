local gfs                       = require("gears.filesystem")
local dpi                       = require("beautiful.xresources").apply_dpi

local theme                     = {}

-- Wallpaper
theme.wallpaper                 = os.getenv("HOME") .. "/pics/backgrounds/gruvbox-linux.png"

-- Font configuration
theme.font                      = "IntelOneMono 18"      -- Base font
theme.taglist_font              = "IntelOneMono Bold 18" -- Tag list font
theme.tasklist_font             = "IntelOneMono 18"      -- Task list font

-- Gruvbox color palette
local colors                    = {
    bg0_h         = "#1d2021", -- Dark background (hard)
    bg0           = "#282828", -- Dark background
    bg0_s         = "#32302f", -- Dark background (soft)
    bg1           = "#3c3836", -- Background 1
    bg2           = "#504945", -- Background 2
    bg3           = "#665c54", -- Background 3
    bg4           = "#7c6f64", -- Background 4

    fg0           = "#fbf1c7", -- Foreground 0
    fg1           = "#ebdbb2", -- Foreground 1
    fg2           = "#d5c4a1", -- Foreground 2
    fg3           = "#bdae93", -- Foreground 3
    fg4           = "#a89984", -- Foreground 4

    red           = "#cc241d", -- Red
    green         = "#98971a", -- Green
    yellow        = "#d79921", -- Yellow
    blue          = "#458588", -- Blue
    purple        = "#b16286", -- Purple
    aqua          = "#689d6a", -- Aqua
    orange        = "#d65d0e", -- Orange

    red_bright    = "#fb4934", -- Bright Red
    green_bright  = "#b8bb26", -- Bright Green
    yellow_bright = "#fabd2f", -- Bright Yellow
    blue_bright   = "#83a598", -- Bright Blue
    purple_bright = "#d3869b", -- Bright Purple
    aqua_bright   = "#8ec07c", -- Bright Aqua
    orange_bright = "#fe8019", -- Bright Orange
}

-- Standard awesome theme configuration

-- Background colors
theme.bg_normal                 = colors.bg0
theme.bg_focus                  = colors.bg1
theme.bg_urgent                 = colors.red
theme.bg_minimize               = colors.bg2
theme.bg_systray                = theme.bg_normal

-- Foreground colors
theme.fg_normal                 = colors.fg1
theme.fg_focus                  = colors.fg0
theme.fg_urgent                 = colors.fg0
theme.fg_minimize               = colors.fg3

-- Border colors
theme.useless_gap               = dpi(3)
theme.border_width              = dpi(2)
theme.border_normal             = colors.bg0
theme.border_focus              = colors.yellow
theme.border_marked             = colors.red_bright

-- Taglist colors
theme.taglist_bg_focus          = colors.yellow
theme.taglist_fg_focus          = colors.bg0_h
theme.taglist_bg_occupied       = colors.bg2
theme.taglist_fg_occupied       = colors.fg1
theme.taglist_bg_empty          = colors.bg1
theme.taglist_fg_empty          = colors.fg3
theme.taglist_bg_urgent         = colors.red
theme.taglist_fg_urgent         = colors.fg0

-- Tasklist colors
theme.tasklist_bg_focus         = colors.bg1
theme.tasklist_fg_focus         = colors.fg0
theme.tasklist_bg_normal        = colors.bg0
theme.tasklist_fg_normal        = colors.fg2

-- Titlebar colors
theme.titlebar_bg_normal        = colors.bg0
theme.titlebar_fg_normal        = colors.fg2
theme.titlebar_bg_focus         = colors.bg1
theme.titlebar_fg_focus         = colors.fg0

-- Menu colors
theme.menu_height               = dpi(36)
theme.menu_width                = dpi(220)
theme.menu_bg_normal            = colors.bg0
theme.menu_fg_normal            = colors.fg1
theme.menu_bg_focus             = colors.bg2
theme.menu_fg_focus             = colors.yellow
theme.menu_border_width         = dpi(2)
theme.menu_border_color         = colors.bg3
theme.menu_padding              = dpi(3)
theme.menu_icon_width           = 0

-- Tooltips
theme.tooltip_bg                = colors.bg1
theme.tooltip_fg                = colors.fg1
theme.tooltip_border_color      = colors.bg3
theme.tooltip_border_width      = dpi(1)

-- Notification settings
theme.notification_bg           = colors.bg0
theme.notification_fg           = colors.fg1
theme.notification_border_color = colors.yellow
theme.notification_border_width = dpi(2)
theme.notification_margin       = dpi(5)

-- Hotkeys popup
theme.hotkeys_bg                = colors.bg0
theme.hotkeys_fg                = colors.fg1
theme.hotkeys_border_color      = colors.yellow
theme.hotkeys_border_width      = dpi(2)
theme.hotkeys_modifiers_fg      = colors.aqua
theme.hotkeys_label_bg          = colors.bg1
theme.hotkeys_label_fg          = colors.fg0
theme.hotkeys_group_margin      = dpi(10)

-- Wibar (top bar) settings
theme.wibar_height              = dpi(36)
theme.wibar_bg                  = colors.bg0
theme.wibar_fg                  = colors.fg1

-- Layout icons - you can replace these with your own custom icons if desired
theme.awesome_icon              = "/usr/share/awesome/icons/awesome16.png"
-- theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
-- theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
-- theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
-- theme.layout_magnifier

return theme
