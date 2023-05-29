MsgC(Color(0, 153, 255), '[Azylix] [Client] Settings.lua Loaded\n')
AddCSLuaFile()

function Azylix.SP.SettingsBtn()
	Azylix.SidePanel.Settings = vgui.Create('DButton', Azylix.SidePanelSP)
	Azylix.SidePanel.Settings:SetText('Settings')
	Azylix.SidePanel.Settings:Dock(TOP)
	Azylix.SidePanel.Settings:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.Settings:DockMargin(5, 5, 5, 0)
	Azylix.SidePanel.Settings.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(54, 54, 54))
		--draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	--Azylix.SidePanel.RunCode.DoClick = Azylix.SP.RunCode
end