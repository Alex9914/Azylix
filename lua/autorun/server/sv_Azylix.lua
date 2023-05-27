MsgC(Color(255, 0, 0), '[Azylix] [Server] Loaded\n')

util.AddNetworkString('Azylix_RunSharedLua')
util.AddNetworkString('Azylix_RunServersideLua')

util.AddNetworkString('Azylix_NetMessageAbuse')
util.AddNetworkString('OpenAzylix')

net.Receive('Azylix_RunServersideLua', function(len, ply)
  if !ply:IsSuperAdmin() then
    file.Append('AzylixNetMessageAbuse.txt', '[' .. util.DateStamp() .. '] [Azylix_RunServersideLua] Net Message Abuse by ' .. ply:Nick() .. ' ' .. '[' .. ply:SteamID() .. ']\n')
    return
  end

  local code = net.ReadString()
  local id = ply:EntIndex()

  RunString('local AzylixS, AzylixFail = pcall(function() ' .. code .. ' end) if !AzylixFail then return end if !s then Entity(' .. id .. '):PrintMessage(4, AzylixFail) Entity(' .. id .. '):PrintMessage(3, AzylixFail) end', '[Azylix Serverside Lua Error]')
end)

net.Receive('Azylix_NetMessageAbuse', function()
  local ply = net.ReadEntity()
  if !ply && !ply:IsSuperAdmin() then
    file.Append('AzylixNetMessageAbuse.txt', '[' .. util.DateStamp() .. '] [Azylix_NetMessageAbuse] Net Message Abuse by ' .. ply:Nick() .. ' ' .. '[' .. ply:SteamID() .. ']\n')
    return
  end

  if !ply:IsSuperAdmin() then
    file.Append('AzylixNetMessageAbuse.txt', '[' .. util.DateStamp() .. '] [Azylix_RunSharedLua] Net Message Abuse by ' .. ply:Nick() .. ' ' .. '[' .. ply:SteamID() .. ']\n')
    return
  end
end)