MsgC(Color(0, 153, 255), '[Azylix] [Client] Home.lua Loaded\n')
AddCSLuaFile()

function Azylix.SP.HomeBtn()
	Azylix.SidePanel.Home = vgui.Create('DButton', Azylix.SidePanelSP)
	Azylix.SidePanel.Home:SetText('Home')
	Azylix.SidePanel.Home:Dock(TOP)
	Azylix.SidePanel.Home:SetTextColor(Color(255, 255, 255))
	Azylix.SidePanel.Home:DockMargin(5, 5, 5, 0)
	Azylix.SidePanel.Home.Paint = function(s, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(114, 137, 218))
		if s.Hovered then
			draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 100))
		end
	end
	Azylix.SidePanel.Home.DoClick = Azylix.SP.Home
end

function Azylix.SP.Home()
	Azylix.InfoArea:Clear()

	Azylix.SidePanel.Home_Title = vgui.Create('DLabel', Azylix.InfoArea)
	Azylix.SidePanel.Home_Title:SetText('Azylix')
	Azylix.SidePanel.Home_Title:SetFont('Azylix_Arial_e')
	surface.SetFont(Azylix.SidePanel.Home_Title:GetFont())
	local tw, th = surface.GetTextSize(Azylix.SidePanel.Home_Title:GetText())
	Azylix.SidePanel.Home_Title:SetSize(tw, th)
	Azylix.SidePanel.Home_Title:SetPos(Azylix.Frame:GetWide() / 2 - tw, 20)
	Azylix.SidePanel.Home_Title:SetTextColor(Color(255, 255, 255))
end