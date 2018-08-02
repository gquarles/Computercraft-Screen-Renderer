renderer = {
    headerColor = colors.white,
    optionColor = colors.white,
    options = {},
    optionClicks = {},
    selectedItem = 1,
    debug = 0,
    header = "Renderer Header",

    setHeader = function(self, header)
        self.header = header
    end,

    addOption = function(self, option, onClick)
        table.insert(self.options, option)
        table.insert(self.optionClicks, onClick)
        if self.debug == 1 then
            print("DEBUG | Inserted " .. option .." into renderer")
        end
    end,

    setHeaderColor = function(self, color)
        self.headerColor = color
    end,

    setOptionColor = function(self, color)
        self.optionColor = color
    end,

    render = function(self)
        while true do
            if self.debug == 1 then
                debugTime = 0.5
            else
                debugTime = 0
            end
            sleep(debugTime)

            term.setTextColor(self.headerColor)
            term.clear()
            term.setCursorPos(1,1)
            sleep(debugTime)

            printCenter(self.header) 
            print()
            sleep(debugTime)

            term.setTextColor(self.optionColor)

            for i = 1, #self.options do
                if i == self.selectedItem then
                    printCenter("[ " .. self.options[i] .. " ]")
                else
                    printCenter(self.options[i])
                end
                print("")
                sleep(debugTime)
            end

            if self.debug == 1 then
                print("DEBUG | Rendered")
            end

            local event, key = os.pullEvent("key")
            
            if key == keys.down then
                if self.selectedItem == #self.options then
                    self.selectedItem = 1
                else
                    self.selectedItem = self.selectedItem + 1
                end
            elseif key == keys.up then
                if self.selectedItem == 1 then
                    self.selectedItem = #self.options
                else
                    self.selectedItem = self.selectedItem - 1
                end
            elseif key == keys.enter then
                click(self)
            end
        end
    end,

    new = function(self, o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
}

function click(obj)
    if obj.debug == 1 then
        print(obj.options[1])
        print(obj.optionClicks[1])
    end
    selected = obj.selectedItem
    funcString = obj.optionClicks[selected]
    func = loadstring(funcString)
    setfenv(func, getfenv())
    func()
    sleep(1)
end

function printCenter(text)
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    term.setCursorPos(math.floor(w-string.len(text))/2, y)
    print(text)
end

----------Do everything below this line----------


--Example uses--

--function hey()
--    print("Works")
--    sleep(3)
--end

--screen = renderer:new{debug = 0}
--screen:addOption("Exit", "break")-
--screen:addOption("Call Func", "hey()")
--screen:addOption("Lua Shell", "shell.run('lua')")
--screen:setHeader("Please Select an Option")
--screen:setHeaderColor(colors.green)
--screen:render()