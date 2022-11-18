MSG_LIGHT_SOURCE_ID = hash('light_source_id')

lights = {}
lights.sources = {}

function lights:new_source(id)
  self.sources[id] = {}
end

-- function lights:print()
--   for k, v in ipairs(self.sources) do
--     print(v)
--   end
-- end

function lights:update_position(id, position)
  if self.sources[id] then
    self.sources[id].position = position
  end
end

function lights:update_color(id, color)
  if self.sources[id] then
    self.sources[id].color = color
  end
end

-- function lights:get_color(id)
--   return go.get(msg.url(nil, id, 'light_source_script'), "color")
-- end

return lights