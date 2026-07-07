local ESX = exports['es_extended']:getSharedObject()

-- Pays a single player based on the configured account type.
local function payPlayer(xPlayer)
    if not xPlayer then return end

    if Config.Account == 'money' then
        xPlayer.addMoney(Config.Amount)
    else
        xPlayer.addAccountMoney(Config.Account, Config.Amount)
    end

    if Config.Notify then
        xPlayer.showNotification(Config.NotifyMessage:format(Config.Amount))
    end
end

CreateThread(function()
    while true do
        Wait(Config.Interval * 60 * 1000) -- minutes -> milliseconds

        -- GetExtendedPlayers returns ONLY currently connected players,
        -- so offline players are never paid.
        local players = ESX.GetExtendedPlayers()

        if #players > 0 then
            for _, xPlayer in pairs(players) do
                payPlayer(xPlayer)
            end

            if Config.ConsoleLog then
                print(('[esx_paycheck_timer] Paid %s player(s) $%s each')
                    :format(#players, Config.Amount))
            end
        end
    end
end)
