hs.hotkey.bind({"alt"}, "Tab", function()
	local app = hs.application.frontmostApplication()
	local windows = app:allWindows()
	local nextWin = nil
	
	-- Finder somehow has one more invisible window, so don't take it into account
	-- (only tested on Yosemite 10.10.1)
	if app:bundleID() == "com.apple.finder" then
		nextWin = windows[#windows-1]
	else
		nextWin = windows[#windows]
	end

	if nextWin:isMinimized() == true then
		nextWin:unminimize()
	else
		nextWin:focus()
	end
end)

hs.hotkey.bind({"command", "shift"}, "m", function()
	local windows = hs.window.allWindows()
	local focused = hs.window.frontmostWindow()
	for _, w in pairs(windows) do
		if w ~= focused then
			w:minimize()
		end	
	end
end)

hs.hotkey.bind({"option"}, "b", function()
	local focused = hs.window.frontmostWindow()
	if focused ~= nil then
		focused:sendToBack()
	end
end)

function switchApp()
  local focused = hs.window.frontmostWindow()
  if focused == nil then
    return
  end

  idx = 1
  local windows = hs.window.allWindows()
  for i, w in ipairs(windows) do
    if w == focused then
      idx = i + 1
      break
    end
  end

  if idx == #windows + 1 then
    idx = 1
  end

  target = windows[idx]
  if target:isMinimized() then
    target = target:unminimize()
  else
    target:focus()
  end
  -- target:focus()
end


function mapCmdTab(event)
    local flags = event:getFlags()
    local chars = event:getCharacters()
    if chars == "\t" and flags:containExactly{'cmd'} then
        switchApp()
        return true
    elseif chars == string.char(25) and flags:containExactly{'cmd'} then
        switchApp()
        return true
    end
end
tapCmdTab = hs.eventtap.new({hs.eventtap.event.types.keyDown}, mapCmdTab)
tapCmdTab:start()
