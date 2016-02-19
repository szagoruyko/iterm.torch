package = "iterm"
version = "scm-1"

source = {
   url = "git://github.com/szagoruyko/iterm.torch",
}

description = {
   summary = "Extra Lua functions.",
   detailed = [[
Display images directly in iTerm2. Version 2.9 or higher is required.
   ]],
   homepage = "https://github.com/szagoruyko/iterm.torch",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "image",
}

build = {
   type = "builtin",
   modules = {
      ['iterm.init'] = 'init.lua',
   }
}
