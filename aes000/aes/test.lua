module(...,package.seeall)

require "common"

--[[
--加解密算法结果，可对照
--http://tool.oschina.net/encrypt?type=2
--http://www.ip33.com/crc.html
--http://tool.chacuo.net/cryptaes
--进行测试
--]]
--
--local slen = string.len
--
----[[
--函数名：print
--功能  ：打印接口，此文件中的所有打印都会加上aliyuniot前缀
--参数  ：无
--返回值：无
--]]
--
local function print(...)
	_G.print("test",...)
end

local function aestest() 
 originStr = "AES128 CBC ZeroPadding test"
 --加密模式：CBC；填充方式：ZeroPadding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
 local encodestr = crypto.aes_encrypt("CBC","ZERO",originStr,"1234567890123456","1234567890666666")
 print(originStr,"encrypt",common.binstohexs(encodestr))
 print("decrypt",crypto.aes_decrypt("CBC","ZERO",encodestr,"1234567890123456","1234567890666666"))	
end										

local function test()
     aestest()
end

sys.time_start(test,5000)
