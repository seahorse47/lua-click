local clt = require("clt")

local function foo()
    return clt.__name__()
end

assert(clt.__name__()=="__main__")

assert(foo~="__main__")

print("tests passed")
