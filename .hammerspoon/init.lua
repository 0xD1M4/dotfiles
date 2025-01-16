local eventtap = hs.eventtap
local eventTypes = eventtap.event.types
local keyboardTracker = nil

local function onKeyboardTrack(event)
    local keycode = event:getKeyCode()

    if keycode == 79 then
        return false
    end

    local flags = event:getFlags()

    flags.fn = false
    flags.cmd = true
    flags.alt = true
    flags.ctrl = true

    event:setFlags(flags)

    --print(hs.inspect(hs.eventtap.checkKeyboardModifiers()))
    --print(keycode)

    return false
end

local function onPress()
    keyboardTracker = eventtap.new({ eventTypes.keyDown }, onKeyboardTrack)
    keyboardTracker:start()

    -- print('hyper pressed')
end

local function onRelease()
    keyboardTracker:stop()
    keyboardTracker = nil

    -- print('hyper released')
end

hs.hotkey.bind(nil, "f18", onPress, onRelease, nil)
