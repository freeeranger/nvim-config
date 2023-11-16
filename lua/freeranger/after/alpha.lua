local alpha = require("alpha")

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[                                                 ]],
    [[                                                 ]],
    [[                                                 ]],
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local function footer()
    local plugin_count = #vim.tbl_keys(require("lazy").plugins())

    return "Neovim loaded with " .. plugin_count .. " plugins"
end

dashboard.section.buttons.val = {
    dashboard.button("SPC b n", "New buffer", ":enew<CR>"),
    dashboard.button("SPC b o", "Open buffer", ":e "),
    dashboard.button("SPC p o", "Open project", ":Explore<CR>"),
    dashboard.button("SPC o c", "Open config", ":let config_path = stdpath('config') . '/init.lua' | execute 'e ' . config_path | execute 'cd ' . expand('%:p:h')<CR>"),
    dashboard.button("SPC p v", "File explorer", ":Explore<CR>"),
    dashboard.button("SPC a q", "Quit neovim", ":qa!<CR>"),
}
dashboard.section.footer.val = footer()


alpha.setup(dashboard.opts)
