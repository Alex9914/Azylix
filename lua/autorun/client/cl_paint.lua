MsgN(Color(0, 153, 255), '[Azylix] [Client] cl_paint.lua Loaded')

function Azylix.Paint.DiscordTheme(s, w, h)
	draw.RoundedBox(6, 0, 0, w, h, Color(49, 51, 56))

	if s:GetClassName() == 'LuaEditablePanel' then
		draw.RoundedBoxEx(6, 0, 0, w, 26, Color(32, 28, 36), true, true, false, false)
		if s:GetTitle() ~= '' then s._text = s:GetTitle() s:SetTitle('') end
		draw.SimpleText(s._text, 'Azylix_Arial_15', 5, 12, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
end