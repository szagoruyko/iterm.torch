package = "iterm"
version = "scm-1"

source = {
   url = "git://github.com/szagoruyko/iterm.torch",
}

description = {
   summary = "Extra Lua functions.",
   detailed = "Display images directly in iTerm2",
   homepage = "https://github.com/szagoruyko/iterm.torch",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "lbase64",
   "image",
}

build = {
   type = "builtin",
   modules = {
      ['iterm.init'] = 'init.lua',
      ['iterm.env'] = 'env.lua',
      ['iterm.dot'] = 'dot.lua',
      ['iterm.gnuplot'] = 'gnuplot.lua',
   }
}
