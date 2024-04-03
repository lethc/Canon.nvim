local variants = require("canon.colors")
local utils = require("canonr.utils")
local cfg = require("canon.config").config
local c = variants[cfg.variant]
local M = {}

local set_terminal_colors = function()
    vim.g.terminal_color_0 = c.gray02
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.magenta
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.white
    vim.g.terminal_color_8 = c.bright_black
    vim.g.terminal_color_9 = c.bright_red
    vim.g.terminal_color_10 = c.bright_green
    vim.g.terminal_color_11 = c.bright_yellow
    vim.g.terminal_color_12 = c.bright_blue
    vim.g.terminal_color_13 = c.super_bright_magenta
    vim.g.terminal_color_14 = c.bright_cyan
    vim.g.terminal_color_15 = c.bright_white
    vim.g.terminal_color_background = c.bg
    vim.g.terminal_color_foreground = c.fg
end

local set_groups = function()
    local highlights = {
        -- Syntax Groups (descriptions and ordering from `:h w18`)
        { hg = "Comment", fg = c.gray04, gui = cfg.comment_style }, -- any comment
        { hg = "Constant", fg = c.red }, -- any constant
        { hg = "String", fg = c.medium_gray_blue }, -- a string constant: "this is a string"
        { hg = "Character", fg = c.green }, -- a character constant: 'c', '\n'
        { hg = "Number", fg = c.red }, -- a number constant: 234, 0xff
        { hg = "Boolean", fg = c.red, cfg.boolean_style }, -- a boolean constant: TRUE, false
        { hg = "Float", fg = c.magenta }, -- a floating point constant: 2.3e10
        { hg = "Identifier", fg = c.fg, cfg.variable_style }, -- any variable name
        { hg = "Function", fg = c.cyan, gui = cfg.function_style }, -- function name (also: methods for classes)
        { hg = "Statement", fg = c.gray_blue }, -- any statement
        { hg = "Conditional", fg = c.blue }, -- if, then, else, endif, switch, etc.
        { hg = "Repeat", fg = c.blue }, -- for, do, while, etc.
        { hg = "Label", fg = c.blue }, -- case, default, etc.
        { hg = "Operator", fg = c.white }, -- sizeof", "+", "*", etc.
        { hg = "Exception", fg = c.purple }, -- try, catch, throw
        { hg = "PreProc", fg = c.fg }, -- generic Preprocessor
        { hg = "Include", fg = c.red }, -- preprocessor #include
        { hg = "Define", fg = c.cyan }, -- preprocessor #define
        { hg = "Macro", fg = c.yellow, gui = "bold" }, -- same as Define
        { hg = "PreCondit", fg = c.cyan }, -- preprocessor #if, #else, #endif, etc.
        { hg = "Type", fg = c.white, gui = "bold" }, -- int, long, char, etc.
        { hg = "StorageClass", fg = c.yellow }, -- static, register, volatile, etc.
        { hg = "Structure", fg = c.gray_blue, gui = "bold" }, -- struct, union, enum, etc.
        { hg = "Typedef", fg = c.yellow }, -- A typedef
        { hg = "Special", fg = c.blue }, -- any special symbol
        { hg = "SpecialChar", fg = c.yellow }, -- special character in a constant
        { hg = "Tag", fg = c.yellow }, -- you can use CTRL-] on this
        { hg = "Delimiter", fg = c.gray_blue }, -- character that needs attention
        { hg = "SpecialComment", fg = c.gray04 }, -- special things inside a comment
        { hg = "Debug" }, -- debugging statements
        { hg = "Underlined", gui = "underline" }, -- text that stands out, HTML links
        { hg = "Ignore" }, -- left blank, hidden
        { hg = "Error", fg = c.red }, -- any erroneous construct
        { hg = "Todo", fg = c.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        --- Keywords
        { hg = "Keyword", fg = c.gray_blue, gui = cfg.keyword_style }, -- any other keyword
        { hg = "@keyword.function", fg = c.cyan, gui = cfg.keyword_style }, -- any other keyword
        { hg = "@keyword.directive", fg = c.cyan, gui = cfg.keyword_style }, -- any other keyword
        { hg = "@keyword.import", fg = c.gray_blue, gui = cfg.keyword_style }, -- any other keyword

        -- Illuminate
        { hg = "illuminatedWord", bg = c.gray03 },
        { hg = "illuminatedCurWord", bg = c.gray03 },
        { hg = "IlluminatedWordText", bg = c.gray03 },
        { hg = "IlluminatedWordRead", bg = c.gray03 },
        { hg = "IlluminatedWordWrite", bg = c.gray03 },

        -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`)
        { hg = "ColorColumn", bg = c.gray01 }, -- used for the columns set with 'colorcolumn'
        { hg = "Conceal" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
        { hg = "Cursor", fg = c.black, bg = c.blue }, -- the character under the cursor
        { hg = "CursorIM" }, -- like Cursor, but used when in IME mode
        { hg = "CursorLine", bg = c.gray01 }, -- the screen line that the cursor is in when 'cursorline' is set
        { hg = "Directory", fg = c.blue }, -- directory names (and other special names in listings)
        -- { hg = "DiffAdd", bg = c.dark_green, fg = c.black }, -- diff mode: Added line
        { hg = "DiffAdd", bg = c.dark_green }, -- diff mode: Added line
        { hg = "DiffChange", bg = c.dark_blue, cterm = "underline" }, -- diff mode: Changed line
        { hg = "DiffDelete", bg = c.dark_red, fg = c.bright_red }, -- diff mode: Deleted line
        { hg = "DiffText", bg = c.gray08 }, -- diff mode: Changed text within a changed line
        { hg = "ErrorMsg", fg = c.red }, -- error messages on the command line
        { hg = "VertSplit", fg = c.gray02 }, -- the column separating vertically split windows
        { hg = "Folded", fg = c.fg, bg = c.alt_bg }, -- line used for closed folds
        { hg = "FoldColumn", fg = c.fg }, -- Left Column used to show folds
        { hg = "SignColumn" }, -- column where signs are displayed
        { hg = "IncSearch", fg = c.bright_yellow, bg = c.gray03 }, --' incsearch' highlighting; also used for the text replaced with ":s///c"
        { hg = "LineNr", fg = c.gray02 }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        { hg = "CursorLineNr" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        { hg = "MatchParen", fg = c.blue, gui = "underline,bold", cterm = "underline" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
        { hg = "ModeMsg" }, --' showmode' message (e.g., "-- INSERT --")
        { hg = "MoreMsg" }, -- more-prompt
        { hg = "NonText", fg = c.gray02 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
        { hg = "Normal", fg = c.fg, bg = cfg.transparent and c.none or c.bg }, -- normal text
        { hg = "Pmenu", fg = c.white, bg = c.black }, -- Popup menu: normal item.
        { hg = "PmenuSel", fg = c.bright_white, bg = c.gray03 }, -- Popup menu: selected item.
        { hg = "PmenuSbar", bg = c.gray02 }, -- Popup menu: scrollbar.
        { hg = "PmenuThumb", bg = c.gray03 }, -- Popup menu: Thumb of the scrollbar.
        { hg = "Question", fg = c.blue }, -- hit-enter prompt and yes/no questions
        { hg = "QuickFixLine", fg = c.cyan, bg = c.gray02 }, -- Current quickfix item in the quickfix window.
        { hg = "Search", fg = c.yellow, bg = c.gray01 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        { hg = "SpecialKey", fg = c.gray08 }, -- Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
        -- { hg = "SpellBad", fg = c.bright_red, gui = "underline" }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
        -- { hg = "SpellCap", fg = c.yellow, gui = "underline" }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
        -- { hg = "SpellLocal", fg = c.bright_green, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
        -- { hg = "SpellRare", fg = c.magenta, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
        { hg = "StatusLine", fg = c.white, bg = c.gray01 }, -- status line of current window
        { hg = "StatusLineNC", fg = c.bg_dark }, -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        { hg = "StatusLineTerm", fg = c.white, bg = c.gray01 }, -- status line of current :terminal window
        { hg = "StatusLineTermNC", fg = c.gray05 }, -- status line of non-current  =terminal window
        { hg = "TabLine", fg = c.gray05 }, -- tab pages line, not active tab page label
        { hg = "TabLineFill" }, -- tab pages line, where there are no labels
        { hg = "TabLineSel", fg = c.white }, -- tab pages line, active tab page label
        { hg = "Terminal", fg = c.fg, bg = c.black }, -- terminal window (see terminal-size-color)
        { hg = "Title", fg = c.blue }, -- titles for output from " =set all", ":autocmd" etc.
        { hg = "Visual", bg = c.gray02 }, -- Visual mode selection
        { hg = "VisualNOS", bg = c.bright_black }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
        { hg = "WarningMsg", fg = c.yellow }, -- warning messages
        { hg = "WildMenu", fg = c.black, bg = c.blue }, -- current match in 'wildmenu' completion
        { hg = "Winbar", fg = c.white, bg = c.gray01 }, -- Winbar
        { hg = "WinbarNC", fg = c.gray05, bg = c.bg_dark }, -- Winbar non-current windows.

        -- HTML
        { hg = "htmlArg", fg = c.bright_red, gui = "italic" }, -- attributes
        { hg = "htmlEndTag", fg = c.gray06 }, -- end tag />
        { hg = "htmlTitle", fg = c.gray07 }, -- title tag text
        { hg = "htmlTag", fg = c.gray06 }, -- tag delimiters
        { hg = "htmlTagN", fg = c.gray06 },
        { hg = "htmlTagName", fg = c.cyan }, -- tag text

        -- Markdown
        { hg = "markdownH1", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownH2", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownH3", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownH4", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownH5", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownH6", fg = c.bright_blue, gui = "bold" },
        { hg = "markdownHeadingDelimiter", fg = c.gray05 },
        { hg = "markdownHeadingRule", fg = c.gray05 },
        { hg = "markdownId", fg = c.cyan },
        { hg = "markdownIdDeclaration", fg = c.blue },
        { hg = "markdownIdDelimiter", fg = c.cyan },
        { hg = "markdownLinkDelimiter", fg = c.gray05 },
        { hg = "markdownLinkText", fg = c.blue, gui = "italic" },
        { hg = "markdownListMarker", fg = c.gray05 },
        { hg = "markdownOrderedListMarker", fg = c.gray05 },
        { hg = "markdownRule", fg = c.fg },
        { hg = "markdownUrl", fg = c.cyan, bg = c.none },
        { hg = "markdownBlockquote", fg = c.gray07 },
        { hg = "markdownBold", fg = c.fg, bg = c.none, gui = "bold" },
        { hg = "markdownItalic", fg = c.fg, bg = c.none, gui = "italic" },
        { hg = "markdownCode", fg = c.yellow },
        { hg = "markdownCodeBlock", fg = c.yellow },
        { hg = "markdownCodeDelimiter", fg = c.gray05 },

        -- Tree sitter
        { hg = "@boolean", fg = c.red, gui = cfg.boolean_style },
        { hg = "@constructor", fg = c.cyan },
        { hg = "@constant.builtin", fg = c.white },
        { hg = "@module", fg = c.white, gui = "italic" },
        { hg = "@property", fg = c.magenta },
        { hg = "@lsp.type.property", fg = c.white },
        { hg = "@punctuation", fg = c.gray06 },
        { hg = "@punctuation.delimiter", fg = c.fg },
        { hg = "@punctuation.bracket", fg = c.white },
        { hg = "@markup.list", fg = c.red },
        { hg = "@string.special.symbol", fg = c.yellow },
        { hg = "@tag", fg = c.blue },
        { hg = "@tag.attribute", fg = c.cyan, gui = "italic" },
        { hg = "@tag.delimiter", fg = c.gray06 },
        { hg = "@type.builtin", fg = c.fg },
        { hg = "@variable", fg = c.fg, gui = cfg.variable_style },
        { hg = "@variable.parameter", fg = c.white, gui = cfg.variable_style },
        -- Tree sitter language specific overrides
        { hg = "@constructor.javascript", fg = c.yellow },
        { hg = "@keyword.clojure", fg = c.bright_cyan, gui = cfg.keyword_style },
        { hg = "@keyword.function.clojure", fg = c.bright_cyan, gui = cfg.function_style },
        -- { hg = "@punctuation.bracket.rust", fg = c.yellow },
        { hg = "@field.java", fg = c.cyan },
        { hg = "@variable.member", fg = c.white },
        -- TypeScript, REACT
        { hg = "@keyword.function.tsx", fg = c.cyan },
        { hg = "@tag.tsx", fg = c.cyan },
        -- Markdown
        { hg = "@markup.heading.1.markdown", fg = c.red, gui = "bold" },
        { hg = "@markup.heading.1.marker.markdown", fg = c.red, gui = "bold" },
        { hg = "@markup.heading.2.markdown", fg = c.yellow, gui = "bold" },
        { hg = "@markup.heading.2.marker.markdown", fg = c.yellow, gui = "bold" },
        { hg = "@markup.heading.3.markdown", fg = c.green, gui = "bold" },
        { hg = "@markup.heading.3.marker.markdown", fg = c.green, gui = "bold" },
        { hg = "@markup.heading.4.markdown", fg = c.cyan, gui = "bold" },
        { hg = "@markup.heading.4.marker.markdown", fg = c.cyan, gui = "bold" },
        { hg = "@markup.heading.5.markdown", fg = c.blue, gui = "bold" },
        { hg = "@markup.heading.5.marker.markdown", fg = c.blue, gui = "bold" },
        { hg = "@markup.heading.6.markdown", fg = c.magenta, gui = "bold" },
        { hg = "@markup.heading.6.marker.markdown", fg = c.magenta, gui = "bold" },
        -- { hg = "@text.reference.markdown_inline", fg = c.gray07  },
        { hg = "@markup.heading.markdown", fg = c.blue, gui = "bold" },
        { hg = "@markup.link", fg = c.cyan },
        { hg = "@markup.link.url.markdown_inline", fg = c.gray04, gui = "underline" },
        { hg = "@markup.raw.markdown_inline", fg = c.cyan, bg = c.dark_cyan, gui = "bold" },
        { hg = "markdownCodeBlock", fg = c.cyan, bg = c.dark_cyan, gui = "bold" },
        { hg = "@markup.strong.markdown_inline", fg = c.gray07, gui = "bold" },
        { hg = "@markup.strong", fg = c.gray07, gui = "bold" },
        { hg = "@markup.italic.markdown_inline", fg = c.medium_gray_blue, gui = "italic" },
        { hg = "@markup.quote.markdown", fg = c.bright_white, bg = c.gray01, gui = "bold,italic" },
        { hg = "@function.macro", fg = c.cyan },
        { hg = "@type.qualifier", fg = c.white, gui = "bold" },

        -- LSP Semantic Token Groups
        { hg = "@lsp.typemod.macro.defaultLibrary", fg = c.cyan },
        { hg = "@lsp.typemod.function.defaultLibrary", fg = c.cyan },
        { hg = "@lsp.typemod.method.defaultLibrary", fg = c.cyan },
        { hg = "@lsp.typemod.enumMember.defaultLibrary", fg = c.white, gui = "bold" },

        { hg = "@lsp.type.enumMember", fg = c.white, gui = "bold" },
        { hg = "@lsp.type.keyword", fg = c.gray_blue },
        { hg = "@lsp.type.namespace", fg = c.gray_blue },
        { hg = "@lsp.type.macro", fg = c.cyan },
        { hg = "@lsp.type.struct", fg = c.gray_blue, gui = "bold" },
        { hg = "@lsp.typemod.enum", fg = c.gray_blue, gui = "bold" },
        { hg = "@lsp.type.interface", fg = c.gray_blue, gui = "bold" },
        { hg = "@lsp.type.parameter", fg = c.fg },

        { hg = "TreesitterContext", bg = c.gray01 },

        -- HTML
        { hg = "@string.special.url", fg = c.gray_blue },

        -- Diagnostics
        { hg = "DiagnosticError", fg = c.red },
        { hg = "DiagnosticWarn", fg = c.yellow },
        { hg = "DiagnosticInfo", fg = c.blue },
        { hg = "DiagnosticHint", fg = c.cyan },
        { hg = "DiagnosticUnderlineError", bg = c.dark_red, fg = c.red, gui = "underline" },
        { hg = "DiagnosticUnderlineWarn", bg = c.dark_yellow, fg = c.yellow, gui = "underline" },
        { hg = "DiagnosticUnderlineInfo", bg = c.dark_blue, fg = c.blue, gui = "underline" },
        { hg = "DiagnosticUnderlineHint", bg = c.dark_cyan, fg = c.cyan, gui = "underline" },

        -- Neovim's built-in language server client
        { hg = "LspReferenceWrite", bg = c.gray03 },
        { hg = "LspReferenceText", bg = c.gray03 },
        { hg = "LspReferenceRead", bg = c.gray03 },
        { hg = "LspSignatureActiveParameter", fg = c.yellow, gui = "bold" },

        -- GitSigns
        { hg = "GitSignsAdd", fg = c.green },
        { hg = "GitSignsChange", fg = c.yellow },
        { hg = "GitSignsDelete", fg = c.red },

        -- Diff
        { hg = "diffAdded", fg = c.bright_green },
        { hg = "diffRemoved", fg = c.bright_red },
        { hg = "diffChanged", fg = c.bright_yellow },
        { hg = "diffOldFile", fg = c.gray04 },
        { hg = "diffNewFile", fg = c.white },
        { hg = "diffFile", fg = c.gray05 },
        { hg = "diffLine", fg = c.cyan },
        { hg = "diffIndexLine", fg = c.magenta },

        -- Hop
        { hg = "HopNextKey", fg = c.bright_yellow },
        { hg = "HopNextKey1", fg = c.bright_blue },
        { hg = "HopNextKey2", fg = c.bright_cyan },
        { hg = "HopUnmatched", fg = c.gray04 },
        { hg = "HopCursor", fg = c.bright_cyan },
        { hg = "HopPreview", fg = c.bright_blue },

        -- Cmp
        { hg = "CursorLineBG", bg = c.gray02 },
        { hg = "CmpItemAbbrDeprecated", fg = c.gray06, gui = "strikethrough" },
        { hg = "CmpItemAbbrMatch", fg = c.blue, gui = "bold" },
        { hg = "CmpItemAbbrMatchFuzzy", fg = c.bright_white, gui = "bold" },
        { hg = "CmpItemMenu", fg = c.gray05 },
        { hg = "CmpItemKindText", fg = c.gray06 },
        { hg = "CmpItemKindFunction", fg = c.cyan },
        { hg = "CmpItemKindVariable", fg = c.blue },
        { hg = "CmpItemKindEnum", fg = c.green },
        { hg = "CmpItemKindSnippet", fg = c.blue },

        -- { hg = "CmpItemKindField", fg = c.red },
        -- { hg = "CmpItemKindProperty", fg = c.blue },
        -- { hg = "CmpItemKindEvent", fg = c.green },
        -- { hg = "CmpItemKindKeyword", fg = c.gray02 },
        -- { hg = "CmpItemKindConstant", fg = c.blue },
        -- { hg = "CmpItemKindConstructor", fg = c.red },
        -- { hg = "CmpItemKindReference", fg = c.blue },
        -- { hg = "CmpItemKindStruct", fg = c.blue },
        -- { hg = "CmpItemKindClass", fg = c.green },
        -- { hg = "CmpItemKindModule", fg = c.yellow },
        -- { hg = "CmpItemKindOperator", fg = c.blue },
        -- { hg = "CmpItemKindVariable", fg = c.blue2 },
        -- { hg = "CmpItemKindFile", fg = c.blue2 },
        -- { hg = "CmpItemKindUnit", fg = c.dark_green },
        -- { hg = "CmpItemKindFolder", fg = c.dark_blue },
        -- { hg = "CmpItemKindMethod", fg = c.bright_green },
        -- { hg = "CmpItemKindValue", fg = c.dark_yellow },
        -- { hg = "CmpItemKindEnumMember", fg = c.bright_red },
        -- { hg = "CmpItemKindInterface", fg = c.yellow },
        -- { hg = "CmpItemKindColor", fg = c.blue },
        -- { hg = "CmpItemKindTypeParameter", fg = c.cyan },

        -- Telescope
        { hg = "TelescopeMatching", fg = c.yellow, gui = "bold" },

        -- Flash
        { hg = "FlashBackdrop", fg = c.gray06 },
        { hg = "FlashLabel", bg = c.yellow, fg = c.bg, gui = "bold" },

        -- Neogit
        -- { hg = "NeogitNotificationInfo", fg = c.bright_green },
        -- { hg = "NeogitNotificationWarning", fg = c.bright_yellow },
        -- { hg = "NeogitNotificationError", fg = c.bright_red },
        -- { hg = "NeogitDiffAddHighlight", fg = c.bright_green, bg = c.dark_green },
        -- { hg = "NeogitDiffDeleteHighlight", fg = c.bright_red, bg = c.dark_red },
        -- { hg = "NeogitDiffContextHighlight", fg = c.fg, bg = c.alt_bg },

        -- { hg = "NeogitHunkHeader", fg = c.fg, bg = c.alt_bg },
        -- { hg = "NeogitHunkHeaderHighlight", fg = c.fg, bg = c.bright_black },
        -- { hg = "NeogitDiffAdd", fg = c.bright_green, bg = c.dark_green },
        -- { hg = "NeogitDiffDelete", fg = c.bright_red, bg = c.dark_red },
        -- { hg = "NeotestAdapterName", fg = c.magenta },
        -- { hg = "NeotestDir", fg = c.cyan },
        -- { hg = "NeotestExpandMarker", fg = c.gray02 },
        -- { hg = "NeotestFailed", fg = c.bright_red },
        -- { hg = "NeotestFile", fg = c.cyan },
        -- { hg = "NeotestFocused", gui = "bold" },
        -- { hg = "NeotestIndent", fg = c.fg },
        -- { hg = "NeotestNamespace", fg = c.blue },
        -- { hg = "NeotestPassed", fg = c.green },
        -- { hg = "NeotestRunning", fg = c.yellow },
        -- { hg = "NeotestSkipped", fg = c.cyan },

        -- Notify
        { hg = "NotifyBackground", fg = c.fg, bg = c.bg },
        -- border
        { hg = "NotifyERRORBorder", fg = c.bright_red, bg = c.bg },
        { hg = "NotifyWARNBorder", fg = c.bright_yellow, bg = c.bg },
        { hg = "NotifyINFOBorder", fg = c.bright_cyan2, bg = c.bg },
        { hg = "NotifyDEBUGBorder", fg = c.bright_blue, bg = c.bg },
        { hg = "NotifyTRACEBorder", fg = c.bright_white, bg = c.bg },
        -- icon
        { hg = "NotifyERRORIcon", fg = c.red, bg = c.bg },
        { hg = "NotifyWARNIcon", fg = c.yellow, bg = c.bg },
        { hg = "NotifyINFOIcon", fg = c.cyan, bg = c.bg },
        { hg = "NotifyDEBUGIcon", fg = c.gray04, bg = c.bg },
        { hg = "NotifyTRACEIcon", fg = c.magenta, bg = c.bg },
        -- title
        { hg = "NotifyERRORTitle", fg = c.red, bg = c.bg },
        { hg = "NotifyWARNTitle", fg = c.yellow, bg = c.bg },
        { hg = "NotifyINFOTitle", fg = c.cyan, bg = c.bg },
        { hg = "NotifyDEBUGTitle", fg = c.gray04, bg = c.bg },
        { hg = "NotifyTRACETitle", fg = c.magenta, bg = c.bg },
        -- body
        { hg = "NotifyERRORBody", fg = c.white, bg = c.bg },
        { hg = "NotifyWARNBody", fg = c.white, bg = c.bg },
        { hg = "NotifyINFOBody", fg = c.white, bg = c.bg },
        { hg = "NotifyDEBUGBody", fg = c.white, bg = c.bg },
        { hg = "NotifyTRACEBody", fg = c.white, bg = c.bg },

        -- Others
        { hg = "yamlFlowIndicator", fg = c.yellow, gui = "bold" },
        { hg = "yamlFlowString", fg = c.bright_cyan },
        { hg = "yamlBlockMappingKey", fg = c.gray_blue },
        { hg = "yamlPlainScalar", fg = c.medium_gray_blue, gui = "bold" },
    }

    utils.highlight(highlights)
end

M.colorscheme = function()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "canon"

    set_terminal_colors()
    set_groups()
end

return M
