local colors = require("canon.colors").dark

return {
    normal = {
        a = { fg = colors.fg, bg = colors.gray08, gui = "bold" },
        b = { fg = colors.white, bg = colors.alt_bg },
        c = { fg = colors.white, bg = colors.alt_bg },
    },
    command = { a = { fg = colors.bg, bg = colors.orange, gui = "bold" } },
    insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
    visual = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
    terminal = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
    replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
    inactive = {
        a = { fg = colors.gray05, bg = colors.bg_dark, gui = "bold" },
        b = { fg = colors.gray05, bg = colors.bg_dark },
        c = { fg = colors.gray05, bg = colors.bg_dark },
    },
}
