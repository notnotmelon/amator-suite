local core = {}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function send_msg_to_dict(dict, msg)
    for _, player in pairs (dict) do
        core.send_msg_to_player(player, msg)
    end    
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function core.get_valid_players()
    local players = {}
    
    for _, player in pairs(game.players) do
        if player.connected then
            local character = player.character
            if character then
                table.insert(players, {player=player, character=character})
            end
        end
    end
    
    return players
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function core.get_player_by_name(player_name)
    local players = core.get_valid_players()
    for _, entry in pairs(players) do
        if entry.player.name == player_name then
            return entry.player
        end
    end
    return nil
end

-- Function -------------------------------------------------------------------
-- Insert item to player with a check if the player allready has a item with 
-- the defined amount ore more, then do nothing
--
-- ----------------------------------------------------------------------------
function core.player_insert_items_safe(player, item_dict, print)
    if not (player and player.valid and item_dict) then return end
    local items = game.item_prototypes

    for name, count in pairs (item_dict) do
        if items[name] then
            local has_count = player.get_item_count(name)
            count = count - has_count
            if count > 0 then
                local item_stack = {name=name, count=count}
                player.insert(item_stack)
                if print then
                    player.print({"", {'apm_msg_put_in_inventory', name}})
                end
                log('Info: core.player_insert_items_safe() insert item: "' .. tostring(name) .. '" amount: "' .. tostring(count) .. '"')
            end
        else
            log('Warning: core.player_insert_items_safe() item: "' .. tostring(name) .. '" does not exist.')
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function grid_add_equipments(grid, equipments)
    if grid and grid.valid and equipments then
        for  _, name in pairs(equipments) do
            local equipment = grid.put({name=name})
            if equipment and equipment.valid and equipment.burner and equipment.burner.inventory then
                equipment.burner.inventory.insert({name='coal', count=10})
            end
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function core.player_insert_armor_safe(player, armor_name, equipments)
    local character_armor = player.get_inventory(defines.inventory.character_armor)
    local character_main = player.get_inventory(defines.inventory.character_main)
    local armor = {name=armor_name, count=1}
    local armor_dressed = false

    if character_armor and character_armor.valid and character_armor.can_insert(armor) then
        character_armor.insert(armor)
        armor_dressed = true
    elseif character_main and character_main.valid and character_main.can_insert(armor) then
        character_main.insert(armor)
    else
        return false
    end

    local grid
    if armor_dressed then
        grid = character_armor[1].grid
    else
        local armor_stack = character_main.find_item_stack(armor_name)
        grid = armor_stack.grid
    end
    grid_add_equipments(grid, equipments)
    player.print({"", {'apm_msg_put_in_inventory', armor_name}})
    return true
end

-- Function -------------------------------------------------------------------
--
--
-------------------------------------------------------------------------------
function core.msg_to_all_players(msg)
    send_msg_to_dict(game.players, msg)
end

-- Function -------------------------------------------------------------------
--
--
-------------------------------------------------------------------------------
function core.send_msg_to_player(player, msg)
    player.print(msg)
end

-- Function -------------------------------------------------------------------
--
--
-------------------------------------------------------------------------------
function core.send_dmg_msg_to_player(player, msg)
    player.print(msg, {r = 255})
end

-- Function -------------------------------------------------------------------
--
--
-------------------------------------------------------------------------------
function core.send_msg_to_force(force, msg)
    force.print(msg, {g = 255})
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

return core