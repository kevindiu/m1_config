input_methods = {
    abc = {prefix = {"Option"}, key = "e"},
    chinese = {prefix = {"Option"}, key = "c"}, 
    japanese = {prefix = {"Option"}, key = "j"}
}

local INPUT_CHINESE = 'com.apple.inputmethod.TCIM.Cangjie'
local INPUT_ABC = 'com.apple.keylayout.ABC'
local INPUT_HIRAGANA = 'com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese'

local function chinese()
    hs.keycodes.currentSourceID(INPUT_CHINESE)
end

local function abc()
    hs.keycodes.currentSourceID(INPUT_ABC)
end

local function hiragana()
    hs.keycodes.currentSourceID(INPUT_HIRAGANA)
end

hs.hotkey.bind(input_methods.abc.prefix, input_methods.abc.key, nil, abc)
hs.hotkey.bind(input_methods.chinese.prefix, input_methods.chinese.key, nil, chinese)
hs.hotkey.bind(input_methods.japanese.prefix, input_methods.japanese.key, nil, hiragana)

local function set_app_input_method(app_name, set_input_method_function, event)
  hs.window.filter.new(app_name):subscribe(event, function()
    set_input_method_function()
  end)
end

set_app_input_method('iTerm2', abc, {hs.window.filter.windowFocused, hs.window.filter.windowCreated})
set_app_input_method({'Telegram', "Line"}, chinese, hs.window.filter.windowFocused)
