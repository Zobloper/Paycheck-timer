# esx_paycheck_timer

A lightweight [ESX](https://github.com/esx-framework) resource that gives every **online** player money on a repeating timer. Fully config-driven — no need to touch the logic to change the amount, interval, or account type.

## Features

- Pays all currently connected players every X minutes
- Configurable amount, interval, and account (`money` / `bank` / `black_money`)
- Only online players are paid — offline players are never included
- Optional in-game notification and server console logging
- Skips the payout loop entirely when the server is empty

## Requirements

- [es_extended](https://github.com/esx-framework/esx_core) (recent build; uses `getSharedObject()` export)

## Installation

1. Download or clone this repository into your server's `resources` folder:
   ```
   cd resources
   git clone https://github.com/YOUR_USERNAME/esx_paycheck_timer.git
   ```
2. Add it to your `server.cfg`:
   ```
   ensure esx_paycheck_timer
   ```
3. Restart the server (or `refresh` then `ensure esx_paycheck_timer` from the console).

## Configuration

All settings live in `config.lua`:

| Option              | Default              | Description                                                        |
| ------------------- | -------------------- | ------------------------------------------------------------------ |
| `Config.Interval`   | `5`                  | Minutes between each payout.                                       |
| `Config.Amount`     | `5000`               | Money given on each payout.                                        |
| `Config.Account`    | `'money'`            | `'money'` (cash), `'bank'`, or `'black_money'`.                    |
| `Config.Notify`     | `true`               | Show a notification to the player when paid.                       |
| `Config.NotifyMessage` | `'You received $%s'` | Notification text. `%s` is replaced with the amount.           |
| `Config.ConsoleLog` | `true`               | Print a line to the server console on each payout.                |

Example — pay $2,500 in cash every 10 minutes:

```lua
Config.Interval = 10
Config.Amount   = 2500
Config.Account  = 'money'
```

## Legacy ESX

Very old `es_extended` builds don't support the `getSharedObject()` export. If `ESX` comes back `nil`, replace the first line of `server.lua` with:

```lua
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
```

## License

Released under the [MIT License](LICENSE).
