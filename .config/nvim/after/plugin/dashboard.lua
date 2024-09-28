------------------------
-- Dashboard settings --
------------------------

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

-- Load a custom dashboard
-- Art from:
-- https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/planets/planets.lua
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.opts.hl = 'DashboardHeader'
dashboard.section.header.val = {
  [[                                                   ]],
  [[                                              ___  ]],
  [[                                           ,o88888 ]],
  [[                                        ,o8888888' ]],
  [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
  [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
  [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
  [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
  [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
  [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
  [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
  [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
  [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
  [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
  [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
  [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
  [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
  [[     ...:.'.:.::::"'    . . . . .'                 ]],
  [[    .. . ....:."' `   .  . . ''                    ]],
  [[  . . . ...."'                                     ]],
  [[  .. . ."'                                         ]],
  [[ .                                                 ]],
  [[                                                   ]],
}

-- Set a custom welcome message at the dashboard footer
local user = os.getenv('USER') or os.getenv('LOGNAME') or os.getenv('USENAME')
if user then user = ' ' .. user else user = '' end
dashboard.section.footer.val = 'Welcome again' .. user .. '!'

-- Apply changes
alpha.setup(dashboard.opts)
