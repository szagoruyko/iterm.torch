local iterm = require 'iterm'
local plot = require 'iterm.gnuplot'

plot.itermfigure()
x = torch.linspace(-1,1)
xx = torch.Tensor(x:size(1),x:size(1)):zero():addr(1,x,x)
xx = xx*math.pi*2
gnuplot.splot({torch.sin(xx)},{torch.sin(xx)+2})
plot.show(); print''
