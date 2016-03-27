local generateGraph = require 'optnet.graphgen'
local models = require 'optnet.models'
local iterm = require 'iterm'
require 'iterm.dot'

local modelname = 'googlenet'
local net, input = models[modelname]()

local g = generateGraph(net, input, graphOpts)
iterm.dot(g, modelname..'.png')
