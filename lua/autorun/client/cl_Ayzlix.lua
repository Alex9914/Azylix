MsgC(Color(0, 153, 255), '[Azylix] [Client] Loaded\n')

surface.CreateFont('Azylix_Arial_15', {
	font = 'Arial',
	size = 15,
	weight = 500,
	antialias = true,
})

surface.CreateFont('Azylix_Arial_e', {
	font = 'Arial',
	size = 50,
	weight = 500,
	antialias = true,
})

local function DiscordTheme(s, w, h)
	draw.RoundedBox(6, 0, 0, w, h, Color(49, 51, 56))
end

net.Receive('OpenAzylix', function(len, ply)
	Azylix.Frame = vgui.Create('DFrame')
	Azylix.Frame:SetTitle('Azylix GUI')
	Azylix.Frame:SetSize(1000, 500)
	Azylix.Frame:Center()
	Azylix.Frame:MakePopup()
	Azylix.Frame.Paint = function(s, w, h)
		DiscordTheme(s, w, h)
		draw.RoundedBoxEx(6, 0, 0, w, 26, Color(32, 28, 36), true, true, false, false)
		if s:GetTitle() ~= '' then s._text = s:GetTitle() s:SetTitle('') end
		draw.SimpleText(s._text, 'Azylix_Arial_15', 8, 5, Color(255, 255, 255))
	end

	Azylix.SidePanel = vgui.Create('DPanel', Azylix.Frame)
	Azylix.SidePanel:SetSize(100, Azylix.Frame:GetTall() - 26)
	Azylix.SidePanel:SetPos(0, 26)
	Azylix.SidePanel.Paint = function(s, w, h)
		draw.RoundedBoxEx(6, 0, 0, w, h, Color(0, 0, 0, 50), false, false, true, false)
	end

	Azylix.InfoArea = vgui.Create('DPanel', Azylix.Frame)
	Azylix.InfoArea:SetPos(Azylix.SidePanel:GetWide(), 26)
	Azylix.InfoArea:SetSize(Azylix.Frame:GetWide() - Azylix.SidePanel:GetWide(), Azylix.Frame:GetTall() - 26) --Azylix.Frame:GetTall() - 26, Azylix.Frame:GetWide())
	Azylix.InfoArea:SetVisible(true)
	Azylix.InfoArea.Paint = function(s, w, h)
		draw.RoundedBoxEx(6, 0, 0, w, h, Color(49, 51, 56), false, false, false, true)
	end

	Azylix.SP.Home()

	Azylix.SidePanelSP = vgui.Create('DScrollPanel', Azylix.SidePanel)
	Azylix.SidePanelSP:Dock(FILL)
	Azylix.SidePanelSP:GetVBar():SetVisible(false)

	Azylix.SP.HomeBtn()
	Azylix.SP.RunCodeBtn()
end)