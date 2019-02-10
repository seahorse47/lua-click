-- hello.lua

local function main(cmd, options, arguments)
    print(string.format("Hi, %s!", arguments["name"]))
    if not options["anonymous"] and options["speaker"]~=nil then
        print(string.format("%40s", "-- from " .. options["speaker"]))
    end
end

local cli = require("click")

local mainCommand = cli.FunctionCommand {
    desc = "Say hi to somebody.",
    help_option = {"-h, --help"},
    options = {
        {"-s, --speaker <name>", required=true, help="Specify the name of speaker."},
        {"-a, --anonymous / -A, --no-anonymous", help="Whether hide the name of speaker."},
    },
    arguments = {
        {name="name", help="Your name."},
    },
    entry_func = main,
}

if cli.__name__()=="__main__" then
    cli.main(mainCommand, nil, arg)
end
