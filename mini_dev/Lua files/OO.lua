--old_APIs保留所有旧API的指针
local old_APIs={
	ScriptSupportEvent=ScriptSupportEvent,World=World,Game=Game,Block=Block,Actor=Actor,Player=Player,Creature=Creature,GameRule=GameRule,UI=UI,Area=Area,Chat=Chat,Team=Team,Item=Item,Backpack=Backpack,VarLib2=VarLib2,Spawnport=Spawnport,MiniTimer=MiniTimer,Graphics=Graphics,ListenParam=ListenParam,Valuegroup=Valuegroup,Customui=Customui,
}
--将所有旧的API的全局指针删除，包括创建它们的class
ScriptSupportEvent=nil;World=nil;Game=nil;Block=nil;Actor=nil;Player=nil;Creature=nil;GameRule=nil;UI=nil;Area=nil;Chat=nil;Team=nil;Item=nil;Backpack=nil;VarLib2=nil;Spawnport=nil;MiniTimer=nil;Graphics=nil;ListenParam=nil;Valuegroup=nil;Customui=nil;class=nil
OOClass={}--[[
面相对象管理类集合，当中的所有table均为类
注意是管理类，管理类一般提供全局的API（对整个游戏有效）和局部对象（比如Actor）的操作方法
管理类最好只创建一个实例化全局对象，除非有多个全局作用域
]]
function OOClass.newObject(class_name)--创建这些管理类的实例化对象的函数（必须）,class_name为类的字符串
	for match_class_name,class in pairs(OOClass) do
		if(match_class_name==class_name) then
			if(type(class)=="table") then--检验是不是类
				local object={}
				setmetatable(object,class)
				return object
			else
				return false
			end
		end
	end
	return false
end
--Event对象
----[[
OOClass.Event={
	__index=OOClass.Event,
	num=0
}
function OOClass.Event:connect(event,func)
	if(type(event)=="string" and type(func)=="function") then
		local id=old_APIs.ScriptSupportEvent:registerEvent(event,func)
		OOClass.num+=1
		return id
	else
		return -1
end
--]]
