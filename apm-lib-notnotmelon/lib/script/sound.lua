local sound = {}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function sound.create_on_character_position(sound, character)
    character.surface.create_entity({name = sound, position = character.position})
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return sound