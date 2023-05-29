MsgC(Color(0, 153, 255), '[Azylix] [Client] SQL.lua Loaded\n')
AddCSLuaFile()

function Azylix.SP.SQLBtn()
	Azylix.SidePanel.SQL = vgui.Create('DButton', Azylix.SidePanelSP)
	Azylix.SidePanel.SQL:SetText('SQL')
	Azylix.SidePanel.SQL:Dock(TOP)
	Azylix.SidePanel.SQL:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.SQL:DockMargin(5, 5, 5, 0)
	Azylix.SidePanel.SQL.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(54, 54, 54))
		--draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	--Azylix.SidePanel.RunCode.DoClick = Azylix.SP.RunCode
end