MsgC(Color(0, 153, 255), '[Azylix] [Client] RunCode.lua Loaded\n')
AddCSLuaFile()

function Azylix.SP.RunCodeBtn()
	Azylix.SidePanel.RunCode = vgui.Create('DButton', Azylix.SidePanelSP)
	Azylix.SidePanel.RunCode:SetText('Run Code')
	Azylix.SidePanel.RunCode:Dock(TOP)
	Azylix.SidePanel.RunCode:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.RunCode:DockMargin(5, 5, 5, 0)
	Azylix.SidePanel.RunCode.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	Azylix.SidePanel.RunCode.DoClick = Azylix.SP.RunCode
end

function Azylix.SP.RunCode()
	Azylix.InfoArea:Clear()

	Azylix.SidePanel.RunCode_LuaEditor = vgui.Create('ayzlix_lua_editor', Azylix.InfoArea)
	Azylix.SidePanel.RunCode_LuaEditor:Dock(FILL)
	Azylix.SidePanel.RunCode_LuaEditor:SetCode(LastContent or '-- Lua Code here --');
end