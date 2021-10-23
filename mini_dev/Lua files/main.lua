--[=[
来源:https://0-00000.github.io/mini_dev/Lua files/main.lua
参见https://0-00000.github.io/mini_dev/documents/
]=]
do--初始化
	--API保留所有旧API的指针
	API={
		ScriptSupportEvent=ScriptSupportEvent,World=World,Game=Game,Block=Block,Actor=Actor,Player=Player,Creature=Creature,GameRule=GameRule,UI=UI,Area=Area,Chat=Chat,Team=Team,Item=Item,Backpack=Backpack,VarLib2=VarLib2,Spawnport=Spawnport,MiniTimer=MiniTimer,Graphics=Graphics,ListenParam=ListenParam,Valuegroup=Valuegroup,Customui=Customui,
	}
	--将所有旧的API的全局指针删除，包括创建它们的class表
	ScriptSupportEvent=nil;World=nil;Game=nil;Block=nil;Actor=nil;Player=nil;Creature=nil;GameRule=nil;UI=nil;Area=nil;Chat=nil;Team=nil;Item=nil;Backpack=nil;VarLib2=nil;Spawnport=nil;MiniTimer=nil;Graphics=nil;ListenParam=nil;Valuegroup=nil;Customui=nil;class=nil
	Static={--常量集合
		Events={
			
		}
	}
	Class={}--[=[
	提供的类的集合，当中的所有table均为类
	这些类包含下列类型:
		管理API的类:
			一般提供全局的API（对整个游戏有效）和局部对象（比如Actor）的创建和操作方法
			这种类创建的对象往往只需要一个，也不建议创建多个
		抽象数据结构类:
			提供常用的数据结构的类
			这种类创建的对象往往需要创建多个
			如果想更方便地创建对象，请把它们的指针赋给局部变量或者全局变量
	]=]
end
function Class.new(object_name)
--创建这些类的实例化对象的函数,object_name为要创建类的字符串
	assert(type(object_name)=="string","Wrong parameter type")
	for class_name,class in pairs(Class) do
		if(class_name==class_name) then
			if(type(class)=="table") then--检验是不是类
				local object={}
				setmetatable(object,{__index=class})
				return object
			else
				error("Class not found")
			end
		end
	end
	error("Class not found")
end
--Event对象
----[=[
Class.Event={
	Event={
		--方法
		new,--新建对象
		delete,--取消事件连接
		__tostring=function(self)--输出行为
			return "Event Object{\n\tevent="..self.event..",\n\tAPIevent="..self.APIevent..",\n\tid="..self.id..",\n\tfunc="..tostring(func).."\n}"
		end,
		__call=function(self,...)
			return self.func(...)
		end,--调用行为
		__gc=function(self)
		    self:delete()
		end,--回收行为
		--属性
		event,--事件名
		APIevent,--在原API中的时间名
		id,--事件的id，用于取消事件连接
		func--事件连接的函数
	},--单事件类
	events=0
}
function Class.Event.Event:delete()
    assert(type(self)=="table","Wrong parameter type")
    API.ScriptSupportEvent:removeEvent(self.APIevent,self.id)
end
function Class.Event.Event:new(event,APIevent,id,func)
	local t={}
	setmetatable(t,{__index=self})
	t.event=event
	t.APIevent=APIevent
	t.id=id
	t.func=func
	return t
end
function Class.Event:connect(event,func)
	assert(type(event)=="string","Wrong parameter type")
	assert(type(func)=="function","Wrong parameter type")
	--[[--预备使用自定义的事件
	local APIevent=""
	do--检查事件字符串是否支持
		if(#eventStr>=10) then--没有这么长的时间字符串，不必去检查浪费CPU资源，直接抛错
			error("Event name error")
		end
		local f=loadstring("return Static.Events."..eventStr)
		if(f) then
			APIstr=f()
		else
			error("Event name error")
		end
	end
	local id=API.ScriptSupportEvent:registerEvent(APIstr,func)
	return self.Event:new(event,APIevent,id,func)
	--]]
	self.events=self.events+1
	----[[
	local id=API.ScriptSupportEvent:registerEvent(event,func)
	return self.Event:new(event,event,id,func)
	--]]
end
--]=]
do--最后处理
	
end
