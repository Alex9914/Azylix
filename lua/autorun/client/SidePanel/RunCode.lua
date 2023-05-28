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

	local HelloThere = vgui.Create('DLabel', Azylix.InfoArea)
	HelloThere:SetText('Azylix')
	HelloThere:SetFont('Azylix_Arial_e')
	surface.SetFont(HelloThere:GetFont())
	local htw, hth = surface.GetTextSize(HelloThere:GetText())
	HelloThere:SetSize(htw, hth)
	HelloThere:SetPos(Azylix.Frame:GetWide() / 2 - htw, Azylix.InfoArea:GetTall() / 2 - 50)
	HelloThere:SetTextColor(Color(100, 100, 100, 30))

	Azylix.SidePanel.RunCode_LuaEditor = vgui.Create('ayzlix_lua_editor', Azylix.InfoArea)
	Azylix.SidePanel.RunCode_LuaEditor:SetSize(Azylix.InfoArea:GetWide(), Azylix.InfoArea:GetTall() - 50)
	Azylix.SidePanel.RunCode_LuaEditor:SetCode('-- Lua Code here --');

	Azylix.SidePanel.RuncodeSV = vgui.Create('DButton', Azylix.InfoArea)
	Azylix.SidePanel.RuncodeSV:SetText('Run Serverside')
	Azylix.SidePanel.RuncodeSV:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.RuncodeSV:SetSize(100, 30)
	Azylix.SidePanel.RuncodeSV:SetPos(Azylix.InfoArea:GetWide() - Azylix.SidePanel.RuncodeSV:GetWide() - 5, Azylix.InfoArea:GetTall() - Azylix.SidePanel.RuncodeSV:GetTall() - 10)
	Azylix.SidePanel.RuncodeSV.DoClick = function()
		local code = Azylix.SidePanel.RunCode_LuaEditor:GetCleanCode()
		net.Start('Azylix_RunSVLua')
			net.WriteString(code)
		net.SendToServer()
	end
	Azylix.SidePanel.RuncodeSV.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end

	Azylix.SidePanel.RuncodeSH = vgui.Create('DButton', Azylix.InfoArea)
	Azylix.SidePanel.RuncodeSH:SetText('Run Shared')
	Azylix.SidePanel.RuncodeSH:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.RuncodeSH:SetSize(100, 30)
	Azylix.SidePanel.RuncodeSH:SetPos(Azylix.SidePanel.RuncodeSV:GetX() - Azylix.SidePanel.RuncodeSH:GetWide() - 5, Azylix.SidePanel.RuncodeSV:GetY())
	Azylix.SidePanel.RuncodeSH.DoClick = function()
		local code = Azylix.SidePanel.RunCode_LuaEditor:GetCleanCode()
		Azylix.RunSharedLua(LocalPlayer(), code)
	end
	Azylix.SidePanel.RuncodeSH.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end

	local SelectedPly = LocalPlayer()

	Azylix.SidePanel.RuncodeCL = vgui.Create('DButton', Azylix.InfoArea)
	Azylix.SidePanel.RuncodeCL:SetText('Run Clientside')
	Azylix.SidePanel.RuncodeCL:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.RuncodeCL:SetSize(100, 30)
	Azylix.SidePanel.RuncodeCL:SetPos(Azylix.SidePanel.RuncodeSH:GetX() - Azylix.SidePanel.RuncodeCL:GetWide() - 5, Azylix.SidePanel.RuncodeSH:GetY())
	Azylix.SidePanel.RuncodeCL.DoClick = function()
		local code = Azylix.SidePanel.RunCode_LuaEditor:GetCleanCode()
		net.Start('Azylix_RunCLLua')
			net.WriteString(code)
			net.WriteEntity(SelectedPly)
		net.SendToServer()
	end
	Azylix.SidePanel.RuncodeCL.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	-- Azylix.SidePanel.CLSelectPly is temp till a better menu is made
	Azylix.SidePanel.CLSelectPly = vgui.Create('DComboBox', Azylix.InfoArea)
	Azylix.SidePanel.CLSelectPly:SetSize(150, 30)
	Azylix.SidePanel.CLSelectPly:SetPos(Azylix.SidePanel.RuncodeCL:GetX() - Azylix.SidePanel.CLSelectPly:GetWide() - 5, Azylix.SidePanel.RuncodeCL:GetY())
	Azylix.SidePanel.CLSelectPly:SetValue('Select Player')
	Azylix.SidePanel.CLSelectPly:SetTextColor(Color(255, 255, 255))
	for _, ply in ipairs(player.GetAll()) do
		Azylix.SidePanel.CLSelectPly:AddChoice(ply:Name())
	end
	Azylix.SidePanel.CLSelectPly.OnSelect = function(s, index, value)
		for _, ply in ipairs(player.GetAll()) do
			if ply:Name() == value then
				SelectPly = ply
			end
		end
	end
	Azylix.SidePanel.CLSelectPly.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
end