# lua-clt

一个用于快速创建命令行程序的Lua模块。

## Quick start

一个简单的`HelloWorld`程序：

```
-- HelloWorld.lua

local function main(cmd, options, arguments)
    print(string.format("Hi, %s!", arguments["name"]))
    if options["speaker"]~=nil then
        print(string.format("%40s", "-- from " .. options["speaker"]))
    end
end

local clt = require("clt")

local mainCommand = clt.FunctionCommand {
    desc = "Say hi to somebody.",
    options = {
        {"-s, --speaker", help="Specify the name of speaker."},
    },
    arguments = {
        {name="name", help="Your name."},
    },
    entry_func = main,
}

if clt.__name__()=="__main__" then
    clt.main(mainCommand, nil, arg)
end
```
