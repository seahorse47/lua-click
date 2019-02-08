local cli = require("click")

local function foo()
    return cli.__name__()
end

assert(cli.__name__()=="__main__")

assert(foo~="__main__")

print("tests passed")
