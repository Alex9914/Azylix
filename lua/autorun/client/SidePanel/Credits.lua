MsgC(Color(0, 153, 255), '[Azylix] [Client] Credits.lua Loaded\n')
AddCSLuaFile()

function Azylix.SP.CreditsBtn()
	Azylix.SidePanel.Credits = vgui.Create('DButton', Azylix.SidePanelSP)
	Azylix.SidePanel.Credits:SetText('Credits')
	Azylix.SidePanel.Credits:Dock(TOP)
	Azylix.SidePanel.Credits:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.Credits:DockMargin(5, 5, 5, 0)
	Azylix.SidePanel.Credits.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(54, 54, 54))
		--draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	--Azylix.SidePanel.RunCode.DoClick = Azylix.SP.RunCode
end