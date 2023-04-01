-- press and hold command+q to kill app
dofile("./commandq.lua")

-- hold option and move the mouse to move the window under the cursor
-- hold option+shift to resize the window under the cursor
dofile("./moveWindow.lua")

-- option+<up/down/left/right> to re-position screen
-- option+return to toggle full screen
-- option+= to increase window size
-- option+- to decrease window size
dofile("./resizeWindow.lua")

-- command+tab to switch application
-- option+b to send application to back
-- command+shift+m to minimize other application
-- alt+tab to switch current application window
dofile("./focusWindow.lua")

dofile("./appShortcut.lua")

dofile("input.lua")
