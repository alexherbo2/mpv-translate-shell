mp.utils = require 'mp.utils'
mp.options = require 'mp.options'

properties = {
  enabled = false
}

options = {
  target = 'auto'
}

mp.options.read_options(options)

hooks = {}

hooks['sub-text'] = function(name, value)
  text = mp.get_property('sub-text')
  result = mp.utils.subprocess({
    args = { 'trans', '-shell', '-brief', '-target', options.target, text }
  })
  infinite = 60
  mp.osd_message(result.stdout, infinite)
end

function enable()
  properties.enabled = true
  mp.set_property('osd-align-x', 'center')
  mp.set_property('osd-align-y', 'top')
  mp.observe_property('sub-text', 'string', hooks['sub-text'])
end

function disable()
  properties.enabled = false
  mp.set_property('osd-align-x', 'left')
  mp.set_property('osd-align-y', 'top')
  mp.unobserve_property(hooks['sub-text'])
  mp.osd_message('')
end

function toggle()
  if properties.enabled then
    disable()
  else
    enable()
  end
end

mp.add_key_binding(nil, 'enable', enable)
mp.add_key_binding(nil, 'disable', disable)
mp.add_key_binding(nil, 'toggle', toggle)
