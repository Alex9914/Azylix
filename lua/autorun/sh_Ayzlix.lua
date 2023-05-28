Azylix = {}
Azylix.SidePanel = {}
Azylix.SP = {}

MsgC(Color(255, 187, 0), '[Azylix] [Shared] Loaded\n')

hook.Add('PlayerSay', 'Azylix', function(ply, str)
	if string.lower(str) != '!azylix' then return end
	--if !ply:IsSuperAdmin() then return end
	net.Start('OpenAzylix')
	net.Send(ply)
end)

concommand.Add('Azylix', function(ply)
	if !ply:IsSuperAdmin() then return end
	net.Start('OpenAzylix')
	net.Send(ply)
end)

function Azylix.IDir(dir, DirFilesOnly)
	if DirFilesOnly == nil then DirFilesOnly = false end
	local files, directories = file.Find(dir .. '/*', 'LUA' )
	for k, v in pairs(files) do
		include(dir .. '/' .. v)
		print(dir .. '/' .. v)
	end

	if DirFilesOnly then return end
	for k, v in pairs(directories) do
		Azylix.IDir(dir .. '/' .. v)
		print(dir .. '/' .. v)
	end
end

Azylix.IDir('autorun/client/SidePanel')

function Azylix.RunSharedLua(ply, code)
	if !ply:IsSuperAdmin() then
		net.Start('Azylix_FuncAbuse')
			net.WriteEntity(ply)
		net.SendToServer()
		return
	end

	RunString(code)
end