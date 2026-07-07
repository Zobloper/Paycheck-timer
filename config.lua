Config = {}

-- Minutes between each payout
Config.Interval = 5

-- Amount of money given on each payout
Config.Amount = 5000

-- Which account to pay into:
--   'money'       -> cash
--   'bank'        -> bank balance
--   'black_money' -> dirty money
Config.Account = 'money'

-- Show a notification to the player when they are paid
Config.Notify = true

-- Notification text. %s is replaced with the amount.
Config.NotifyMessage = 'You received $%s'

-- Print a line to the server console on each payout (useful for debugging)
Config.ConsoleLog = true
