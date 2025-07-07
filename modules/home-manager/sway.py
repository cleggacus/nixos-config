#!/usr/bin/python

import i3ipc

focused_command = 'border pixel 2'
unfocused_command = 'border none'
ipc              = i3ipc.Connection()
prev_focused     = None

def update_borders(container, is_focused):
    if not is_focused:
        container.command(unfocused_command)
        return

    ws = ipc.get_tree().find_focused().workspace()
    leaves = ws.leaves() if ws else []

    if len(leaves) == 1:
        container.command(unfocused_command)
    else:
        container.command(focused_command)

for window in ipc.get_tree():
    if window.focused:
        prev_focused = window
    else:
        window.command(unfocused_command)

def on_window_focus(ipc, focused):
    global prev_focused

    if focused.container.id != prev_focused.id:
        update_borders(focused.container, True)
        update_borders(prev_focused, False)

        prev_focused = focused.container

ipc.on("window::focus", on_window_focus)
ipc.main()
