#!/usr/bin/env python3

# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# This is here so configs done via the GUI are still loaded.
# Remove it to not load settings done via the GUI.
config.load_autoconfig()

config.set('content.headers.user_agent', 'cloudflare 503 workaround', 'https://gitlab.com/*')
config.set('content.headers.user_agent', 'cloudflare 503 workaround', 'chat.openai.com/chat/*')


# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'mpv': 'spawn --userscript qutebrowser_view_in_mpv.bash',
	        'vlc': 'spawn --userscript qutebrowser_view_in_vlc.bash',
	        'w': 'session-save',
	        'q': 'close',
	        'qa': 'quit',
	        'wq': 'quit --save',
	        'wqa': 'quit --save'}

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
# c.auto_save.session = False
# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>',
	                        '<Ctrl-6>': '<Ctrl-^>',
	                        '<Ctrl-M>': '<Return>',
	                        '<Ctrl-J>': '<Return>',
	                        '<Shift-Return>': '<Return>',
	                        '<Enter>': '<Return>',
	                        '<Shift-Enter>': '<Return>',
	                        '<Ctrl-Enter>': '<Ctrl-Return>'}
	
# Allow websites to read canvas elements. Note this is needed for some
# websites to work properly.
# Type: Bool
c.content.canvas_reading = False

# Which cookies to accept.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-unknown-3rdparty'

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.accept_language = 'en-US,en;q=0.5'

# Custom headers for qutebrowser HTTP requests.
# Type: Dict
c.content.headers.custom = {'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'}

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
 # c.content.ssl_strict = True

# Enable WebGL.
# Type: Bool
c.content.webgl = False

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['kitty', '-e', 'nvim', '{file}']

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://searx.envs.net/?q={}',
	                    'aw': 'https://wiki.archlinux.org/index.php/{}',
	                    'aur': 'https://aur.archlinux.org/packages/{}',
	                    'g': 'https://www.google.de/search?q={}',
	                    'wen': 'https://en.wikipedia.org/wiki/{}',
	                    'y': 'https://youtube.com/results?search_query={}',
	                    }
	
# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads/qute_down'

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Fonts
# {{@@ header() @@}}
# flake8: noqa: E266


c = c  # noqa
config = config  # noqa

## Font used in the completion categories.
## Type: Font
# c.fonts.completion.category = 'bold default_size default_family'

## Font used in the completion widget.
## Type: Font
# c.fonts.completion.entry = 'default_size default_family'

## Font used for the context menu.
## If set to null, the Qt default is used.
## Type: Font
# c.fonts.contextmenu = None

## Font used for the debugging console.
## Type: QtFont
# c.fonts.debug_console = 'default_size default_family'

## Default font families to use. Whenever "default_family" is used in a font
## setting, it’s replaced with the fonts listed here. If set to an empty
## value, a system-specific monospace default is used.
## Type: List of Font, or Font
# c.fonts.default_family = []
# c.fonts.default_family = ["Fira Code", "Droid Sans Mono", "xos4 Terminus", "Terminus", "Monospace", "DejaVu Sans Mono", "Monaco", "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", "Courier", "Liberation Mono", "monospace", "Fixed", "Consolas", "Terminal"]

c.fonts.default_family = ["Fira Code"]
# c.fonts.default_family = ["Iosevka Medium"]

## Default font size to use. Whenever "default_size" is used in a font
## setting, it’s replaced with the size listed here. Valid values are either
## a float value with a "pt" suffix, or an integer value with a "px" suffix.
## Type: String
c.fonts.default_size = "10pt"

## Font used for the downloadbar.
## Type: Font
# c.fonts.downloads = 'default_size default_family'

## Font used for the hints.
## Type: Font
# c.fonts.hints = 'bold default_size default_family'

## Font used in the keyhint widget.
## Type: Font
# c.fonts.keyhint = 'default_size default_family'

## Font used for error messages.
## Type: Font
# c.fonts.messages.error = 'default_size default_family'

## Font used for info messages.
## Type: Font
# c.fonts.messages.info = 'default_size default_family'

## Font used for warning messages.
## Type: Font
# c.fonts.messages.warning = 'default_size default_family'

## Font used for prompts.
## Type: Font
# c.fonts.prompts = 'default_size sans-serif'

## Font used in the statusbar.
## Type: Font
# c.fonts.statusbar = 'default_size default_family'

## Font used for selected tabs.
## Type: Font
# c.fonts.tabs.selected = 'default_size default_family'

## Font used for unselected tabs.
## Type: Font
# c.fonts.tabs.unselected = 'default_size default_family'

## Font family for cursive fonts.
## Type: FontFamily
# c.fonts.web.family.cursive = ''

## Font family for fantasy fonts.
## Type: FontFamily
# c.fonts.web.family.fantasy = ''

## Font family for fixed fonts.
## Type: FontFamily
# c.fonts.web.family.fixed = ''

## Font family for sans-serif fonts.
## Type: FontFamily
# c.fonts.web.family.sans_serif = ''

## Font family for serif fonts.
## Type: FontFamily
# c.fonts.web.family.serif = ''

## Font family for standard fonts.
## Type: FontFamily
# c.fonts.web.family.standard = ''

## The default font size for regular text.
## Type: Int
# c.fonts.web.size.default = 16

## The default font size for fixed-pitch text.
## Type: Int
# c.fonts.web.size.default_fixed = 13

## The hard minimum font size.
## Type: Int
# c.fonts.web.size.minimum = 0

## The minimum logical font size that is applied when zooming out.
## Type: Int
# c.fonts.web.size.minimum_logical = 6

# Keybinds
# {{@@ header() @@}}
# flake8: noqa: E266

c = c  # noqa
config = config  # noqa

## This setting can be used to map keys to other keys. When the key used
## as dictionary-key is pressed, the binding for the key used as
## dictionary-value is invoked instead. This is useful for global
## remappings of keys, for example to map Ctrl-[ to Escape. Note that
## when a key is bound (via `bindings.default` or `bindings.commands`),
## the mapping is ignored.
## Type: Dict
# c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Ctrl-I>': '<Tab>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

## Bindings for normal mode
config.bind('<Ctrl-Shift-p>', 'hint links spawn --verbose --detach /home/frank/Scripts/fillplaylist.sh push {hint-url}')
config.bind('<Ctrl-Shift-o>', 'spawn --verbose --detach /home/frank/Scripts/fillplaylist.sh play')
config.bind('<Ctrl-Shift-d>', 'hint links spawn --verbose --detach mpv {hint-url} --input-ipc-server=/tmp/mpvsocket')
config.bind('<Ctrl-m>', 'open https://social.linux.pizza/home')
config.bind('<Ctrl-r>', 'open https://app.revolt.chat/')
config.bind('<Ctrl-g>', 'open https://github.com/frannks')
config.bind('<Ctrl-s>', 'open https://github.com/search')
config.bind('<Ctrl-b>', 'open https://bard.google.com/?hl=pt')
config.bind('<Ctrl-Shift-c>', 'open https://chat.openai.com/auth/login')
config.bind('<Ctrl-i>', 'open https://invidious.slackjeff.com.br/feed/popular')
config.bind('cp', 'config-cycle colors.webpage.darkmode.enabled ;; restart')
# config.bind("'", 'enter-mode jump_mark')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
# config.bind('.', 'repeat-command')
# config.bind('/', 'set-cmd-text /')
# config.bind(':', 'set-cmd-text :')
# config.bind(';I', 'hint images tab')
# config.bind(';O', 'hint links fill :open -t -r {hint-url}')
# config.bind(';R', 'hint --rapid links window')
# config.bind(';Y', 'hint links yank-primary')
# config.bind(';b', 'hint all tab-bg')
# config.bind(';d', 'hint links download')
# config.bind(';f', 'hint all tab-fg')
# config.bind(';h', 'hint all hover')
# config.bind(';i', 'hint images')
# config.bind(';o', 'hint links fill :open {hint-url}')
# config.bind(';r', 'hint --rapid links tab-bg')
# config.bind(';t', 'hint inputs')
# config.bind(';y', 'hint links yank')
# config.bind(',n', f'config-cycle --temp content.user_stylesheets ~/Linux/solarized-everything-css/css/solarized-all-sites-dark.css "" ;; reload')
config.bind('<Alt-1>', 'tab-focus 1')
config.bind('<Alt-2>', 'tab-focus 2')
config.bind('<Alt-3>', 'tab-focus 3')
config.bind('<Alt-4>', 'tab-focus 4')
config.bind('<Alt-5>', 'tab-focus 5')
config.bind('<Alt-6>', 'tab-focus 6')
config.bind('<Alt-7>', 'tab-focus 7')
config.bind('<Alt-8>', 'tab-focus 8')
config.bind('<Alt-9>', 'tab-focus 9')
config.bind('<Alt-0>', 'tab-focus -1')
# config.bind('<Ctrl-A>', 'navigate increment')
# config.bind('<Ctrl-Alt-p>', 'print')
# config.bind('<Ctrl-B>', 'scroll-page 0 -1')
# config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-F>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
# config.bind('<Ctrl-PgDown>', 'tab-next')
# config.bind('<Ctrl-PgUp>', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Return>', 'follow-selected -t')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-T>', 'open -t')
# config.bind('<Ctrl-Tab>', 'tab-focus last')
# config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'enter-mode passthrough')
config.bind('<Ctrl-W>', 'tab-close')
# config.bind('<Ctrl-X>', 'navigate decrement')
# config.bind('<Ctrl-^>', 'tab-focus last')
config.bind('<Ctrl-h>', 'home')
# config.bind('<Ctrl-p>', 'tab-pin')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
config.bind('<F11>', 'fullscreen')
config.bind('<F5>', 'reload')
# config.bind('<Return>', 'follow-selected')
# config.bind('<back>', 'back')
# config.bind('<forward>', 'forward')
config.bind('=', 'zoom')
# config.bind('?', 'set-cmd-text ?')
# config.bind('@', 'run-macro')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('D', 'tab-close -o')
# config.bind('F', 'hint all tab')
# config.bind('G', 'scroll-to-perc')
# config.bind('G', 'spawn --userscript ~/.config/qutebrowser/userscripts/ddg2g.py')
# config.bind('H', 'back')
# config.bind('J', 'tab-next')
# config.bind('K', 'tab-prev')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
# config.bind('L', 'forward')
config.bind('M', 'bookmark-add')
# config.bind('M', 'hint links userscript ~/.config/qutebrowser/userscripts/videos_vlc.sh')
# config.bind('M', 'hint links spawn mpv {hint-url}')
# config.bind('N', 'search-prev')
# config.bind('O', 'set-cmd-text -s :open -t')
config.bind('O', 'set-cmd-text :open {url:pretty}')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('R', 'reload -f')
# config.bind('Sb', 'open qute://bookmarks#bookmarks')
config.bind('Sh', 'open qute://history')
config.bind('Sq', 'open qute://bookmarks')
# config.bind('Ss', 'open qute://settings')
# config.bind('T', 'tab-focus')
config.bind('T', 'set-cmd-text :open -t {url:pretty}')
config.bind('t', 'set-cmd-text -s :open -t')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('[[', 'navigate prev')
# config.bind(']]', 'navigate next')
config.bind('ä', 'back')
config.bind('$', 'forward')
config.bind('à', 'tab-prev')
config.bind('£', 'tab-next')
# config.bind('`', 'enter-mode set_mark')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
config.bind('cc', 'spawn --userscript ~/.config/qutebrowser/userscripts/dict.cc.sh')
# config.bind('cd', 'download-clear')
# config.bind('co', 'tab-only')
# config.bind('d', 'tab-close')
# config.bind('f', 'hint')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gC', 'tab-clone')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gl', 'tab-move -')
# config.bind('gm', 'tab-move +')
config.bind('<Ctrl-Shift-PgUp>', 'tab-move -')
config.bind('<Ctrl-Shift-PgDown>', 'tab-move +')
# config.bind('go', 'set-cmd-text :open {url:pretty}')
# config.bind('gr', 'tab-move +')
# config.bind('gt', 'set-cmd-text -s :buffer')
# config.bind('gu', 'navigate up')
# config.bind('h', 'scroll left')
# config.bind('i', 'enter-mode insert')
# config.bind('j', 'scroll down')
# config.bind('k', 'scroll up')
# config.bind('l', 'scroll right')
# config.bind('m', 'quickmark-save')
# config.bind('m', 'spawn --userscript ~/.config/qutebrowser/userscripts/videos_mpv.sh')
# config.bind('m', 'spawn mpv {url}')
# config.bind('n', 'search-next')
# config.bind('o', 'set-cmd-text -s :open')
# config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
# config.bind('q', 'record-macro')
config.bind('r', 'reload')
# config.bind('sf', 'save')
# config.bind('sk', 'set-cmd-text -s :bind')
# config.bind('sl', 'set-cmd-text -s :set -t')
# config.bind('ss', 'set-cmd-text -s :set')
# config.bind('th', 'back -t')
# config.bind('tl', 'forward -t')
# config.bind('u', 'undo')
# config.bind('v', 'enter-mode caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wh', 'back -w')
# config.bind('wi', 'inspector')
# config.bind('wl', 'forward -w')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xb', 'config-cycle statusbar.hide')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('xt', 'config-cycle tabs.show always switching')
# config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
# config.bind('yD', 'yank domain -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
config.bind('<LEFT>', 'scroll left', mode='caret')
config.bind('<DOWN>', 'scroll down', mode='caret')
config.bind('<UP>', 'scroll up', mode='caret')
config.bind('<RIGHT>', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
config.bind('<LEFT>', 'move-to-prev-char', mode='caret')
config.bind('<DOWN>', 'move-to-next-line', mode='caret')
config.bind('<UP>', 'move-to-prev-line', mode='caret')
config.bind('<RIGHT>', 'move-to-next-char', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
config.bind('W', 'move-to-prev-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
config.bind('<UP>', 'command-history-prev', mode='command')
config.bind('<DOWN>', 'command-history-next', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'command-history-next', mode='command')
# config.bind('<Escape>', 'leave-mode', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'command-history-prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'leave-mode', mode='hint')
# config.bind('<Return>', 'follow-hint', mode='hint')

## Bindings for insert mode
config.bind('<Ctrl-e>', 'open-editor', mode='insert')
# config.bind('<Escape>', 'leave-mode', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Ctrl-V>', 'leave-mode', mode='passthrough')

## Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
# config.bind('n', 'prompt-accept no', mode='prompt')
# config.bind('y', 'prompt-accept yes', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'leave-mode', mode='register')

# Load color scheme
# config.source('gruvbox.py')
config.source('qutewal.py')
