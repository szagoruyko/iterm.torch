require 'gnuplot'
local iterm = require 'iterm'

local itermplot = gnuplot

function itermplot.itermfigure(engine)
   engine = engine or 'png'
   itermplot.name = paths.tmpname()..'.'..engine
   gnuplot[engine..'figure'](itermplot.name)
end

function itermplot.show()
   gnuplot.plotflush()
   gnuplot.close()
   iterm.display(itermplot.name)
   itermplot.name = nil
end

return itermplot
