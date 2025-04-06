-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   hs.reload()
-- end)
-- hs.alert.show("Config loaded")

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "ctrl"}, "return", function () hs.application.open("ghostty.app") end)
hs.hotkey.bind({"cmd", "ctrl"}, "b", function () hs.application.open("Google Chrome.app") end)
hs.hotkey.bind({"cmd", "ctrl"}, "t", function () hs.application.open("translater.app") end)
hs.hotkey.bind({"cmd", "ctrl"}, "f", function () hs.application.open("Finder.app") end)

hs.hotkey.bind({"cmd", "ctrl"}, "1", function () hs.eventtap.keyStrokes("jhzhou.ai@gmail.com") end)
hs.hotkey.bind({"cmd", "ctrl"}, "2", function () hs.eventtap.keyStrokes("zzzz") end)
