ii = 0
function newCounter()
	local i =0
	return function() --anonymous function
		ii = i +1
		print(ii)
		return ii
	end
end

c1 = newCounter()
print(c1())
print(c1())

function myPower(x) 
	return function(y) return y^x end 
end

pow2 = myPower(2)
pow3 = myPower(3)

print(pow2(4))
print(pow3(2))

function getUserInfo(id) 
	print(id) 
	return "haoel", 37, "haoel@hotmail.com", "http://coolshell.cn" 
end 

name, age, email, website, bGay = getUserInfo() 

t = {[20]=100, ['name']="ChenHao", [3.14]="PI"} 
print(t[20])

h = {}
h.wb ="http://baidu.com"
--local age = h.age
h.hs=false
h.name ="test"
print(h["name"])

arr = {"string", 100, "haoel", function() print("coolshell.cn") end} 
for i=1, #arr do 
  print(arr[i]) 
end 

for k, v in pairs(t) do 
	    print(k, v) 
    end 


print(_G['t'])


Person={}

function Person:new(p)
	local obj=p
	if(obj==nil)then
		obj={name="Chj",age =12,hs=true}
	end
	self.__index = self
	return setmetatable(obj,self)
end

function Person:toString() 
   return self.name..":"..self.age..":"..(self.hs and "hs" or "ugly")
end

local a = Person:new()
print(a:toString())

ks = Person:new({name="King's fucking", age=70, handsome=false}) 
print(ks:toString()) 
