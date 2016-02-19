-- For explanation see https://iterm2.com/images.html
-- 2016 Sergey Zagoruyko

local iterm = {}
require 'image'
local base64 = require 'base64'
local ffi = require 'ffi'

local function print_osc()
   if os.getenv'TERM' == 'screen' then
      io.write'\27Ptmux;\27\27]'
   else
      io.write'\27]'
   end
end

local function print_st()
   if os.getenv'TERM' == 'screen' then
      io.write'\a\27\\'
   else
      io.write'\a'
   end
end

function iterm.image(img, opts)
   if torch.type(img) == 'string' then -- assume that it is path
      img = image.load(img, 3) -- TODO: revamp this to just directly load the blob, infer file prefix, and send.
   end
   if torch.isTensor(img) or torch.type(img) == 'table' then
      opts = opts or {padding=2}
      opts.input = img
      local imgDisplay = image.toDisplayTensor(opts)
      if imgDisplay:dim() == 2 then 
	 imgDisplay = imgDisplay:view(1, imgDisplay:size(1), imgDisplay:size(2))
      end
      -------------------------------------------------------------
      local compressed = image.compressJPG(imgDisplay)
      local size = compressed:numel()*ffi.sizeof'long'
      local enc = base64.encode(ffi.string(compressed:data(), size))

      print_osc()

      io.write('1337;File=')
      io.write('size='..size..';')
      io.write('inline=1:')
      io.write(enc)

      print_st()
   else
      error('unhandled type in iterm.image:' .. torch.type(img))
   end
end

return iterm
