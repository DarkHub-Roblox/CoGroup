local serverSettings = require(game.ServerScriptService["CoSecure Anti Exploit"].Settings)
local databaseService = require(99763061998283)

game.Players.PlayerAdded:Connect(function(player)
	local logTime = os.time()
	local logDate = os.date()

	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/joinLogs/"..player.Name.."/"..logTime.."/joinDate", logDate)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/joinLogs/"..player.Name.."/"..logTime.."/joinTime", logTime)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/joinLogs/"..player.Name.."/"..logTime.."/activePlayers", #game.Players:GetPlayers())
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/joinLogs/"..player.Name.."/"..logTime.."/maxPlayers", game.Players.MaxPlayers)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/joinLogs/"..player.Name.."/"..logTime.."/placeId", game.PlaceId)

	player.Chatted:Connect(function(message)
		local logTime = os.time()
		local logDate = os.date()
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/messageDate", logDate)
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/messageTime", logTime)
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/activePlayers", #game.Players:GetPlayers())
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/maxPlayers", game.Players.MaxPlayers)
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/placeId", game.PlaceId)
		databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/chatLogs/"..player.Name.."/"..logTime.."/message", message)
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	local logTime = os.time()
	local logDate = os.date()
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/leaveLogs/"..player.Name.."/"..logTime.."/leaveDate", logDate)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/leaveLogs/"..player.Name.."/"..logTime.."/leaveTime", logTime)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/leaveLogs/"..player.Name.."/"..logTime.."/activePlayers", #game.Players:GetPlayers())
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/leaveLogs/"..player.Name.."/"..logTime.."/maxPlayers", game.Players.MaxPlayers)
	databaseService:GetDatabase(serverSettings["License Key"]):SetAsync("serverLogs/"..game.PlaceId.."/leaveLogs/"..player.Name.."/"..logTime.."/placeId", game.PlaceId)
end)