MsgC(Color(0, 153, 255), '[Azylix] [Client] RunCode.lua Loaded\n')
AddCSLuaFile()

Azylix.SidePanel.RunCode_LuaEditor_LastContent = nil

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

	local HelloThere = vgui.Create('DLabel', Azylix.InfoArea)
	HelloThere:SetText('Azylix')
	HelloThere:SetFont('Azylix_Arial_e')
	surface.SetFont(HelloThere:GetFont())
	local htw, hth = surface.GetTextSize(HelloThere:GetText())
	HelloThere:SetSize(htw, hth)
	HelloThere:SetPos(Azylix.Frame:GetWide() / 2 - htw, Azylix.InfoArea:GetTall() / 2 - 50)
	HelloThere:SetTextColor(Color(107, 107, 107))

	Azylix.SidePanel.RunCode_LuaEditor = vgui.Create('ayzlix_lua_editor', Azylix.InfoArea)
	Azylix.SidePanel.RunCode_LuaEditor:SetSize(Azylix.InfoArea:GetWide(), Azylix.InfoArea:GetTall() - 50)
	Azylix.SidePanel.RunCode_LuaEditor:SetCode(Azylix.SidePanel.RunCode_LuaEditor_LastContent or '-- Lua Code here --');

	Azylix.SidePanel.Runcode_RunServerside = vgui.Create('DButton', Azylix.InfoArea)
	Azylix.SidePanel.Runcode_RunServerside:SetText('Run Serverside')
	Azylix.SidePanel.Runcode_RunServerside:SetSize(100, 30)
	Azylix.SidePanel.Runcode_RunServerside:SetPos(Azylix.InfoArea:GetWide() - Azylix.SidePanel.Runcode_RunServerside:GetWide() - 10, Azylix.InfoArea:GetTall() - Azylix.SidePanel.Runcode_RunServerside:GetTall() - 10)
	Azylix.SidePanel.Runcode_RunServerside.DoClick = function()
		local code = Azylix.SidePanel.RunCode_LuaEditor:GetCleanCode()
		net.Start('Azylix_RunServersideLua')
			net.WriteString(code)
		net.SendToServer()
	end
end