# Computercraft Screen Renderer

Computercraft Screen Renderer is  a basic implementation of an api in a Minecraft mod called Computercraft. This repo was for learning purposes and is now deprecated.

## Installation

Clone the repo into a computer
```bash
pastebin get jjpRy3cc render
```

## Usage

```lua
--Declare a new screen
screen = renderer:new{debug = 0}

--Declare a custom function
function helloWorld()
   print("Hello, World!")
end

--Add some options
screen:addOption("Exit", "break")-
screen:addOption("Call Func", "helloWorld()")
screen:addOption("Lua Shell", "shell.run('lua')")

--Set the screen header text and color
screen:setHeader("Please Select an Option")
screen:setHeaderColor(colors.green)

--Display the screen to the user
screen:render()
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
