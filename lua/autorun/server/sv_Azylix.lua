MsgC(Color(255, 0, 0), '[Azylix] [Server] Loaded\n')

util.AddNetworkString('Azylix_RunCLLua')
util.AddNetworkString('Azylix_RunSVLua')

util.AddNetworkString('Azylix_FuncAbuse')
util.AddNetworkString('OpenAzylix')

local function NetMessageAbuse(ply, netmsg)
  file.Append('AzylixNetMessageAbuse.txt', '[' .. util.DateStamp() .. '] ' .. netmsg .. ' Net Message Abuse by ' .. ply:Nick() .. ' ' .. '[' .. ply:SteamID() .. ']\n')
end

net.Receive('Azylix_RunSVLua', function(len, ply)
  if !ply:IsSuperAdmin() then
    NetMessageAbuse(ply, '[Azylix_RunSVLua]')
    return
  end

  local code = net.ReadString()
  local id = ply:EntIndex()

  RunString('local AzylixS, AzylixFail = pcall(function() ' .. code .. ' end) if !AzylixFail then return end if !s then Entity(' .. id .. '):PrintMessage(4, AzylixFail) Entity(' .. id .. '):PrintMessage(3, AzylixFail) end', '[Azylix SV Lua Error]')
end)

net.Receive('Azylix_RunCLLua', function(len, ply)
  local code = net.ReadString()
  local entply = net.ReadEntity()

  if !ply:IsSuperAdmin() then
    NetMessageAbuse(ply, '[Azylix_RunCLLua]')
    return
  end

  if entply != nil then
    entply:SendLua(code)
  end
end)

net.Receive('Azylix_FuncAbuse', function()
  local ply = net.ReadEntity()
  if !ply then return end

  if !ply:IsSuperAdmin() then
    NetMessageAbuse(ply, '[Azylix_FuncAbuse || Azylix.RunSharedLua()]')
    return
  end
end)