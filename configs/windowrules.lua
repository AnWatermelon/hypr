-- windowrules.lua

--------------------------
-- APPLICATION BLUR/OPACITY
--------------------------

-- Multimedia video: no blur, full opacity
hl.window_rule({ match = { tag = "multimedia_video*" }, no_blur = true })
hl.window_rule({ match = { tag = "multimedia_video*" }, opacity = "1.0" })

-- Settings panel: slight transparency
hl.window_rule({ match = { tag = "settings*" }, opacity = "0.8" })

-- Nautilus file manager
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, opacity = "0.8" })

-- Text editors
hl.window_rule({ match = { class = "gedit|org.gnome.TextEditor|mousepad" }, opacity = "0.9" })

-- PulseAudio volume control
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, opacity = "0.9" })

-- Kitty terminal
hl.window_rule({ match = { class = "kitty" }, opacity = "0.9" })

-- Messaging / chat apps  (active 0.85 override, inactive 0.7 override, fullscreen 1.0 override)

-- Spotify
hl.window_rule({ match = { class = "Spotify" }, opacity = "0.8 override 0.6 override 1 override" })

-- Zen browser
hl.window_rule({ match = { class = "zen" }, opacity = "0.9 override 0.7 override 1 override" })

-- Uncomment to apply to all viewer-tagged windows:
-- hl.window_rule({ match = { tag = "viewer*" }, opacity = "0.8 override 0.6 override 1 override" })

--------------------------
-- LAYER RULES
--------------------------

-- Waybar
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0.5 })

-- Notification tag (generic)
hl.layer_rule({ match = { namespace = "notif*" }, ignore_alpha = 0.5 })

-- Logout dialog
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- SwayNC (control centre + notification window)
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, xray = false })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, xray = false })

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel)$",
  },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

--------------------------
-- FLOATING RULES
--------------------------

-- Tag-based floats
hl.window_rule({ match = { tag = "settings*" }, float = true })
hl.window_rule({ match = { tag = "viewer*" }, float = true })
hl.window_rule({ match = { tag = "multimedia_video*" }, float = true, size = { 900, 506 } })
hl.window_rule(
  {
    match = {
      tag = "^(file_chooser)$"
    },
    float = true,
    center = true,
    size = { 1000, 650 }
  }
)

-- PulseAudio volume control
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = { "50%", "60%" } })

-- Suppress maximize events globally
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

-- Fix XWayland drag issues
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

--------------------------
-- DIALOGUES / POP-UPS
--------------------------

-- Save / pick-file dialogs
hl.window_rule({
  match  = { title = "Save As|Save a File|Pick Files" },
  float  = true,
  size   = { "50%", "60%" },
  center = true,
})

-- "Open Files" dialog (matched by initialTitle)
hl.window_rule({
  match = { initial_title = "Open Files" },
  float = true,
  size  = { "70%", "60%" },
})
