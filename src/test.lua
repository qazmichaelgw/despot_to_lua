print "this is a test file"
function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

print_r (lua_pocman)
a = {aa = "t", bb = {c = 1, d = 5}, cc = function() return 6 end}
print_r (a)
--[[for k, v in pairs(lua_pocman) do
    print (k)
    print (v)
    print (type(v))
    print "-------"
end--]]
print "begin code!"
model = lua_pocman.FullPocman()
print_r (model)
tui = lua_pocman.SimpleTUI()
if tui == nil then
    print ('nil tui value')
end
print_r (tui)
tui.run()
