MsgC(Color(0, 153, 255), '[Azylix] [Client] Loaded\n')

concommand.Add('Azylix', function(ply)
	if !ply:IsSuperAdmin() then return end
	net.Start('CCOpenAzylix')
	net.SendToServer()
end)

net.Receive('OpenAzylix', function(len, ply)
	if !LocalPlayer():IsSuperAdmin() then return end
	Azylix.Frame = vgui.Create('DFrame')
	Azylix.Frame:SetTitle('Azylix ' .. Azylix.Version)
	Azylix.Frame:SetSize(1000, 500)
	Azylix.Frame:Center()
	Azylix.Frame:MakePopup()
	Azylix.Frame.Paint = Azylix.Paint.DiscordTheme

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

	Azylix.SP.RunFilesBtn()
	Azylix.SP.SQLBtn()
	Azylix.SP.SettingsBtn()
	Azylix.SP.CreditsBtn()
end)