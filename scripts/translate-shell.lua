mp.options = require 'mp.options'

state = {}
state.enabled = false

options = {}
options.target = 'auto'
mp.options.read_options(options)

function on_sub_text_change(name, text)
  result = mp.command_native({
    name = 'subprocess',
    capture_stdout = 'yes',
    args = { 'trans', '-shell', '-brief', '-no-warn', '-target', options.target, '--', text }
  })
  -- Let’s just pretend inf equals 60
  inf = 60
  mp.osd_message(result.stdout, inf)
end

function enable()
  state.enabled = true
  mp.set_property('osd-align-x', 'center')
  mp.set_property('osd-align-y', 'top')
  mp.observe_property('sub-text', 'string', on_sub_text_change)
end

function disable()
  state.enabled = false
  mp.set_property('osd-align-x', 'left')
  mp.set_property('osd-align-y', 'top')
  mp.unobserve_property(on_sub_text_change)
  mp.osd_message('')
end

function toggle()
  if state.enabled then
    disable()
  else
    enable()
  end
end

mp.add_key_binding(nil, 'enable', enable)
mp.add_key_binding(nil, 'disable', disable)
mp.add_key_binding(nil, 'toggle', toggle)
