vim.g.dashboard_disable_statusline = 1
vim.g.dashbaord_default_executive = 'telescope'

local silly_pre_strings = {
	"                  I didn't choose the",
	"                       I wanted",
	"                     I wanted a life",
	"                     I'm masochist",
	"                       I'm a god!",
	"                    (╯°□°）╯︵ ┻━┻",
	"I wanted a random string, so I set a windows dev in front of vim",
	"                       Emacs bad."
}


local silly_post_strings = {
	"                     it chose me.",
	"                      it worked.",
	"                      I hate vim.",
	"                    I hate vim.",
	"                       Vim good.",
	"                 It's clobberin' time!",
	"                 nill pointer exception"
}

----- Viewer suggestions
-- I didn't choose the ... VIM LIFE ... it chose me
-- I'm a masochist ... VIM LIFE ...
-- I wanted .. VIM LIFE .. it chose me
-- I wanted a random string,
--   so I set a windows dev in front of vim ... VIM LIFE ... it worked
-- .. VIM LIFE .. chose us today
-- emacs bad. .. VIM LIFE .. Vim good.

math.randomseed(os.clock()*100000000000)
local random_pre_index = math.random(7)
local random_post_index = math.random(7)

vim.g.dashboard_custom_header = {
	" ",
	" ",
	silly_pre_strings[random_pre_index],
	" ",
	" ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄    ▄▄▄     ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ",
	"█..█ █..█...█..█▄█..█  █...█   █...█.......█.......█",
	"█..█▄█..█...█.......█  █...█   █...█....▄▄▄█....▄▄▄█",
	"█.......█...█.......█  █...█   █...█...█▄▄▄█...█▄▄▄ ",
	"█.......█...█.......█  █...█▄▄▄█...█....▄▄▄█... ▄▄▄█",
	" █.....██...█.██▄██.█  █...... █...█...█   █...█▄▄▄ ",
	"  █▄▄▄█ █▄▄▄█▄█   █▄█  █▄▄▄▄▄▄▄█▄▄▄█▄▄▄█   █▄▄▄▄▄▄▄█",
	" ",
	" ",
	silly_post_strings[random_post_index]
}

vim.g.dashboard_custom_section = {
	a = { description = { "   Find File                 SPC f f" }, command = "Telescope find_files" },
	b = { description = { "   Recents                   SPC f o" }, command = "Telescope oldfiles" },
	c = { description = { "   Find Word                 SPC f w" }, command = "Telescope live_grep" },
	d = { description = { "   New File                  SPC f n" }, command = "DashboardNewFile" },
	e = { description = { "   Bookmarks                 SPC b m" }, command = "Telescope marks" },
	f = { description = { "   Last Session              SPC s l" }, command = "SessionLoad" },
}

local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
vim.g.dashboard_custom_footer = {
	" ",
	" loaded " .. plugins_count .. " plugins ",
}
