## Documentation:
## qute://help/configuring.html
## qute://help/settings.html

## Remove this to not load settings done via the GUI (loads the yaml file)
# config.load_autoconfig()

# making J and K more intuitive
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# making d, u, x like Vimium
config.bind('x', 'tab-close')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('X', 'undo')
config.bind('<Ctrl-U>', 'undo')

c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}

# Either webengine/webkit. (QtWebKit was discontinued and maintained by someone
# else, QtWebEngine is what chromium uses, it's a bit more resource-heavy).
c.backend = 'webengine'

# Appearance:
# Lots of stuff can be played with in c.colors.*

# Size of autocompletion bar as percentage of window
c.completion.height = "30%"

# always/never/multiple-tabs/downloads
c.confirm_quit = ['downloads']

# Look at what all this *means* and document it well
c.content.cookies.accept = 'no-3rdparty'
c.content.cookies.store = True
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'

c.downloads.location.prompt = True
c.downloads.location.remember = True

c.editor.command = ['gvim', '-f', '{}']

c.url.default_page = 'about:blank'

## '{}' is the placeholder which will be replaced by the search term,
## Use '{{' and '}}' for literal '{'/'}' symbols.
## Search by using :open <shortcut> <search_term>
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'aw': 'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}',
        'so': 'https://stackoverflow.com/search?q={}',
        'tw': 'https://twitter.com/{}',
        'vw': 'http://vim.wikia.com/wiki/Special:Search?fulltext=Search&query={}',
        'wi': 'https://en.wikipedia.org/wiki/Special:Search/{}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        }
