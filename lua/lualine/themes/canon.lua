local colors = require("canon.colors").dark

return {
    normal = {
        a = { fg = colors.fg, bg = colors.gray08, gui = "bold" },
        b = { fg = colors.white, bg = colors.none },
        c = { fg = colors.white, bg = colors.alt_bg },
    },
    command = {
        a = { fg = colors.bg, bg = colors.light_gray, gui = "bold" },
        z = { fg = colors.bg, bg = colors.light_gray, gui = "bold" },
    },
    insert = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        z = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    },
    visual = {
        a = { fg = colors.bg, bg = colors.light_gray, gui = "bold" },
        z = { fg = colors.bg, bg = colors.light_gray, gui = "bold" },
    },
    terminal = {
        a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
        z = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    },
    replace = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
        z = { fg = colors.bg, bg = colors.red, gui = "bold" },
    },
    inactive = {
        a = { fg = colors.gray05, bg = colors.bg_dark, gui = "bold" },
        b = { fg = colors.gray05, bg = colors.bg_dark },
        c = { fg = colors.gray05, bg = colors.bg_dark },
    },
}
