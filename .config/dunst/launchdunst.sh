#!/usr/bin/env zsh

. $HOME/.cache/wal/colors.sh

pidof dunst && killall dunst

sleep 0.1

exec 1>$HOME/.config/dunst/dunstrc

pr -T <<- EOF
# User: Franklin Souza
# Telegram: FranklinTech
[global]
    ### Display ###
    # Which monitor should the notifications be displayed on.
    monitor = 1
    # Display notification on focused monitor.  Possible modes are:
    #   mouse: follow mouse pointer
    #   keyboard: follow window with keyboard focus
    #   none: don't follow anything
    #
    # "keyboard" needs a window manager that exports the
    # _NET_ACTIVE_WINDOW property.
    # This should be the case for almost all modern window managers.
    #
    # geometry
    #geometry = "200x5-10+40"
    # If this option is set to mouse or keyboard, the monitor option
    # will be ignored.
    follow = mouse
    indicate_hidden = true
    # dynamic width from 0 to 300
    # width = (0, 300)
    # constant width of 300
    width = 240
    # The maximum height of a single notification, excluding the frame.
    height = 143
    # Position the notification in the top right corner
    origin = top-right
    # Offset from the origin
    offset = 30x45
    # Shrink window if it's smaller than the width.  Will be ignored if
    # width is 0.
    shrink = yes
    # The transparency of the window.  Range: [0; 100].
    # This option will only work if a compositing window manager is
    # present (e.g. xcompmgr, compiz, etc.).
    transparency = 10
    # The height of the entire notification.  If the height is smaller
    # than the font height and padding combined, it will be raised
    # to the font height and padding.
    notification_height = 0
    # Draw a line of "separator_height" pixel height between two
    # notifications.
    # Set to 0 to disable.
    separator_height = 0
    # Padding between text and separator.
    padding = 8 
    # Horizontal padding.
    horizontal_padding = 8
    # Defines width in pixels of frame around the notification window.
    # Set to 0 to disable.
    frame_width = 3
    # Defines color of the frame around the notification window.
    #frame_color = ""
    # Define a color for the separator.
    # possible values are:
    #  * auto: dunst tries to find a color fitting to the background;
    #  * foreground: use the same color as the foreground;
    #  * frame: use the same color as the frame;
    #  * anything else will be interpreted as a X color.
    # separator_color = frame
    # separator_color = auto
    # Sort messages by urgency.
    #sort = yes
    sort = yes
    # Don't remove messages, if the user is idle (no mouse or keyboard input)
    # for longer than idle_threshold seconds.
    # Set to 0 to disable.
    # A client can set the 'transient' hint to bypass this. See the rules
    # section for how to disable this if necessary
    #idle_threshold = 120
    idle_threshold = 0
    ### Text ###
    #font = M+ 1mn 10
    #font = FiraCode 9
    font = Iosevka Medium 9
    #font = JetBrains Mono NL Medium 9
    #font = Poppins 9
    #font = Bahamas 9
    #font = LiterationMono Nerd Font Book 9
    # The spacing between lines.  If the height is smaller than the
    # font height, it will get raised to the font height.
    line_height = 0
    # Possible values are:
    # full: Allow a small subset of html markup in notifications:
    #        <b>bold</b>
    #        <i>italic</i>
    #        <s>strikethrough</s>
    #        <u>underline</u>
    #
    #        For a complete reference see
    #        <http://developer.gnome.org/pango/stable/PangoMarkupFormat.html>.
    #
    # strip: This setting is provided for compatibility with some broken
    #        clients that send markup even though it's not enabled on the
    #        server. Dunst will try to strip the markup but the parsing is
    #        simplistic so using this option outside of matching rules for
    #        specific applications *IS GREATLY DISCOURAGED*.
    #
    # no:    Disable markup parsing, incoming notifications will be treated as
    #        plain text. Dunst will not advertise that it has the body-markup
    #        capability if this is set as a global setting.
    #
    # It's important to note that markup inside the format option will be parsed
    # regardless of what this is set to.
    markup = full
    # The format of the message.  Possible variables are:
    #   %a  appname
    #   %s  summary
    #   %b  body
    #   %i  iconname (including its path)
    #   %I  iconname (without its path)
    #   %p  progress value if set ([  0%] to [100%]) or nothing
    #   %n  progress value if set without any extra characters
    #   %%  Literal %
    # Markup is allowed
    #
    #   <b>bold</b>
    #   <i>italic</i>
    #   <s>strikethrough</s>
    #   <u>underline</u>
    #
    
    format = "<span foreground='$color3' weight='bold' font='Iosevka Medium 9'>%s</span>\n<span foreground='$color3' font='Iosevka Medium 9'>%b</span>"
    # Alignment of message text.
    # Possible values are "left", "center" and "right".
    alignment = center
    vertical_alignment = center
    # Show age of message if message is older than show_age_threshold
    # seconds.
    # Set to -1 to disable.
    show_age_threshold = 60
    # Split notifications into multiple lines if they don't fit into
    # geometry.
    word_wrap = yes
    # When word_wrap is set to no, specify where to make an ellipsis in long lines.
    # Possible values are "start", "middle" and "end".
    ellipsize = middle
    # Ignore newlines '\\n' in notifications.
    ignore_newline = no
    # Stack together notifications with the same content
    stack_duplicates = true
    # Hide the count of stacked notifications with the same content
    hide_duplicate_count = true
    # Display indicators for URLs (U) and actions (A).
    show_indicators = no
    ### Icons ###
    # Align icons left/right/off
    icon_position = right
    # Scale larger icons down to this size, set to 0 to disable
    max_icon_size = 100
    # Paths to default icons.
    #icon_path = /usr/share/icons/gruvbox-dark-icons-gtk/64x64/actions:/usr/share/icons/gruvbox-dark-icons-gtk/64x64/apps:/usr/share/icons/gruvbox/64x64/status:/usr/share/icons/gruvbox-dark-icons-gtk/64x64/filesystems:/usr/share/icons/gruvbox-dark-icons-gtk/64x64/mimetypes:/usr/share/icons/gruvbox-dark-icons-gtk/64x64/emblems:/usr/share/icons/gruvbox-dark-icons-gtk/64x64:places
    ### History ###
    # Should a notification popped up from history be sticky or timeout
    # as if it would normally do.
    sticky_history = yes
    # Maximum amount of notifications kept in history
    history_length = 20
    ### Misc/Advanced ###
    # dmenu path.
    dmenu = /usr/bin/dmenu -p dunst:
    # Browser for opening urls in context menu.
    browser = /usr/bin/qutebrowser -C $HOME/.config/qutebrowser/config.py
    # Always run rule-defined scripts, even if the notification is suppressed
    always_run_script = true
    # Define the title of the windows spawned by dunst
    title = Dunst
    # Define the class of the windows spawned by dunst
    class = Dunst
    # Print a notification on startup.
    # This is mainly for error detection, since dbus (re-)starts dunst
    # automatically after a crash.
    startup_notification = false
    # Manage dunst's desire for talking
    # Can be one of the following values:
    #  crit: Critical features. Dunst aborts
    #  warn: Only non-fatal warnings
    #  mesg: Important Messages
    #  info: all unimportant stuff
    # debug: all less than unimportant stuff
    verbosity = mesg
    # Define the corner radius of the notification window
    # in pixel size. If the radius is 0, you have no rounded
    # corners.
    # The radius will be automatically lowered if it exceeds half of the
    # notification height to avoid clipping text and/or icons.
    corner_radius = 5
    ### Legacy
    # Use the Xinerama extension instead of RandR for multi-monitor support.
    # This setting is provided for compatibility with older nVidia drivers that
    # do not support RandR and using it on systems that support RandR is highly
    # discouraged.
    #
    # By enabling this setting dunst will not be able to detect when a monitor
    # is connected or disconnected which might break follow mode if the screen
    # layout changes.
    force_xinerama = false
    ### mouse
    # Defines action of mouse event
    # Possible values are:
    # * none: Don't do anything.
    # * do_action: If the notification has exactly one action, or one is marked as default,
    #              invoke it. If there are multiple and no default, open the context menu.
    # * close_current: Close current notification.
    # * close_all: Close all notifications.
    mouse_left_click = do_action
    mouse_middle_click = close_current
    mouse_right_click = close_all
# Experimental features that may or may not work correctly. Do not expect them
# to have a consistent behaviour across releases.
[experimental]
    # Calculate the dpi to use on a per-monitor basis.
    # If this setting is enabled the Xft.dpi value will be ignored and instead
    # dunst will attempt to calculate an appropriate dpi value for each monitor
    # using the resolution and physical size. This might be useful in setups
    # where there are multiple screens with very different dpi values.
    per_monitor_dpi = false
[shortcuts]
    # Shortcuts are specified as [modifier+][modifier+]...key
    # Available modifiers are "ctrl", "mod1" (the alt-key), "mod2",
    # "mod3" and "mod4" (windows-key).
    # Xev might be helpful to find names for keys.
    # Close notification.
    close = ctrl+space
    # Close all notifications.
    close_all = ctrl+shift+space
    # Redisplay last message(s).
    # On the US keyboard layout "grave" is normally above TAB and left
    # of "1". Make sure this key actually exists on your keyboard layout,
    # e.g. check output of 'xmodmap -pke'
    #history = ctrl+grave
    #history = ctrl+period
    # Context menu.
    #context = ctrl+shift+period
# IMPORTANT: colors have to be defined in quotation marks.
# Otherwise the "#" and following would be interpreted as a comment.
# frame_color = "coco"
# frame_color = "#000000"
# separator_color = "#1c1c1c""
[base16_low]
    msg_urgency = low
    frame_color = "$color2"
    background = "$background"
    #foreground = "$foreground"
[base16_normal]
    msg_urgency = normal
    frame_color = "$color2"
    background = "$background"
    #foreground = "$foreground"
[base16_critical]
    msg_urgency = critical
    frame_color = "$color1"
    background = "$background"
    #foreground = "$foreground"
EOF

exec 1>&-

sleep 0.5 

dunst &
