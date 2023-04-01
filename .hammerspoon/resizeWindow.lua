-- hs.window.animationDuration = 0
units = {
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 }
}
resizeSize = 60

mash = { 'option' }
hs.hotkey.bind(mash, 'right', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'left', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, 'return', function() hs.window.focusedWindow():toggleFullScreen() end)

hs.hotkey.bind(mash, "=", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local moveSize = resizeSize / 2
    f.w = f.w + resizeSize
    f.h = f.h + resizeSize
    f.x = f.x - moveSize
    f.y = f.y - moveSize
    if f.x < max.x then
        f.x = max.x
    end
    if f.y < max.y then
        f.y = max.y
    end
    if f.w > max.w then
        f.w = max.w
    end
    if f.h > max.h then
        f.h = max.h
    end
    win:setFrame(f)
end)

hs.hotkey.bind(mash, "-", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local moveSize = resizeSize / 2
    f.w = f.w - resizeSize
    f.h = f.h - resizeSize
    f.x = f.x + moveSize
    f.y = f.y + moveSize
    win:setFrame(f)
end)
