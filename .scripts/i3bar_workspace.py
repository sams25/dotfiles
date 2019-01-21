#!/usr/bin python

#
# THIS IS NOT BEING USED. DO NOT USE THIS. BUT PLAY WITH i3ipc EVENTS.
#
# Hides i3bar for the terminal workspace because we use tmux's bar instead
#

# This is $ws1 on .config/i3/config
TERMINAL_WORKSPACE = "Terminal"

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

# Define a callback to be called when you switch workspaces.
def on_workspace_focus(self, e):
    # The first parameter is the connection to the ipc and the second is an object
    # with the data of the event sent from i3.
    if e.current and e.current.name == TERMINAL_WORKSPACE:
        i3.command('bar mode hide')

# Subscribe to events
i3.on('workspace::focus', on_workspace_focus)

# Start the main loop and wait for events to come in.
i3.main()
