# lua-click

一个用于快速创建命令行程序的Lua模块。该项目从python库[click](https://pypi.org/project/click/)借鉴了不少灵感，项目名也沿用了"click"这一缩写（Command Line Interface Creation Kit）。

## Dependencies

唯一的依赖就是：

* lua >= 5.1

该模块已在`lua-5.1.5`, `lua-5.2.4`, `lua-5.3.5`下验证通过。


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

local cli = require("click")

local mainCommand = cli.FunctionCommand {
    desc = "Say hi to somebody.",
    options = {
        {"-s, --speaker", help="Specify the name of speaker."},
    },
    arguments = {
        {name="name", help="Your name."},
    },
    entry_func = main,
}

if cli.__name__()=="__main__" then
    cli.main(mainCommand, nil, arg)
end
```
