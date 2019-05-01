--定义2个表
a = {5,6}
b ={7,8}
--c做元表
c = {}

--重定义加法
c.__add = function(op1,op2)
	for _,item in ipairs(op2) do
		table.insert(op1,item) 
	end
	return op1 
end

--将a 的metatable设置为c
--c的__add域改写后将a的Metatable设置为c,
--当执行到加法的操作时, Lua首先会检查a是否有Metatable并且Metatable中是否存在__add域, 
--如果有则调用, 否则将检查b的条件(和a相同), 
--如果都没有则调用默认加法运算, 而table没有定义默认加法运算, 则会报错
setmetatable(a,c)
d = a+b

print(d[4])
print(c["__add"])
