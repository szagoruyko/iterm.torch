local iterm = require 'iterm.env'
require 'graph'

-- see `man dot` for all preferences
local default_attr = {
   color = 'yellow',
   style = 'filled',
   shape = 'box',
   fontsize = 10,
}

-- as default rendering is not pretty we set our own graphNodeAttributes
-- if they are not set already
-- mutates the graph!
function iterm.dot(g,fname,attr)
   attr = attr or default_attr
   local f = function() return attr end
   for i,v in ipairs(g.nodes) do
      if v.data and not v.graphNodeAttributes then v.graphNodeAttributes = f end
   end
   fname = fname or os.tmpname()..'.pdf'
   graph.graphvizFile(g, 'dot', fname)
   iterm.display(fname)
end

return iterm
