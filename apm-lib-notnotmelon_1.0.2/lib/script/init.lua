local init = {}

-- Definitions ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local technologies_list = {}
local technologies_conditional = {}
local technologies_conditional_recipes = {}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function starts_with(str, start)
   return str:sub(1, #start) == start
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function init.add_technology_conditional(unlock_technology, parent_technologies)
    local p_techs = {}
    if type(parent_technologies) == 'table' then
        p_techs = parent_technologies
    elseif type(parent_technologies) == 'string' then
        p_techs = {parent_technologies}
    end

    if not technologies_conditional[unlock_technology] then
        technologies_conditional[unlock_technology] = p_techs
    else
        for _, p_tech in pairs(p_techs) do
            table.insert(technologies_conditional[unlock_technology], p_tech)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function init.add_technology_conditional_recipe(unlock_technology, cond_recipes)
    local p_recipes = {}
    if type(cond_recipes) == 'table' then
        p_recipes = cond_recipes
    elseif type(cond_recipes) == 'string' then
        p_recipes = {cond_recipes}
    end

    if not technologies_conditional_recipes[unlock_technology] then
        technologies_conditional_recipes[unlock_technology] = p_recipes
    else
        for _, p_recipe in pairs(p_recipes) do
            table.insert(technologies_conditional_recipes[unlock_technology], p_recipe)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function init.add_technology(technology_name)
    technologies_list[technology_name] = true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function activate_technologies_conditional(force)
    log('Info: execute: activate_technologies_conditional() for force: ' ..tostring(force.name))

    local technologies = force.technologies

    for technology, cond_technologies in pairs(technologies_conditional) do
        local c_tech = technologies[technology]
        if c_tech and not c_tech.researched then
            for _, cond_tech in pairs(cond_technologies) do
                local cond_technology = technologies[cond_tech]
                if cond_technology and cond_technology.researched then
                    c_tech.researched = true
                    log('-> for force: ' ..tostring(force.name).. ' state for technology: "' ..tostring(c_tech.name).. '" changed to "enabled"')
                    break
                end
            end
        end
    end
    log('Info: finished: activate_technologies_conditional() for force: ' ..tostring(force.name))
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function activate_technologies_conditional_recipes(force)
    log('Info: execute: activate_technologies_conditional_recipes() for force: ' ..tostring(force.name))

    local technologies = force.technologies
    local recipes = force.recipes

    for technology, cond_recipes in pairs(technologies_conditional_recipes) do
        local tech = technologies[technology]
        if tech and not tech.researched then
            for _, p_recipe in pairs(cond_recipes) do
                local cond_recipe = recipes[p_recipe]
                if cond_recipe.enabled then
                    tech.researched = true
                    log('-> for force: ' ..tostring(force.name).. ' state for technology: "' ..tostring(tech.name).. '" changed to "enabled"')
                    break
                end
            end
        end
    end
    log('Info: finished: activate_technologies_conditional_recipes() for force: ' ..tostring(force.name))
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_technologies(force)
    log('Info: execute: check_technologies() for force: ' ..tostring(force.name))
    
    local technologies = force.technologies
    local recipes = force.recipes

    for _, technology in pairs(technologies) do
        if starts_with(technology.name, 'apm_') or technologies_list[technology.name] then
            technology.reload()
            local is_researched = technology.researched
            local is_enabled = technology.prototype.enabled

            if not technology.enabled and is_enabled then
                technology.enabled = true
                log('-> for force: ' ..tostring(force.name).. ' state for: "' ..tostring(technology.name).. '" changed to "true", technology is enabled.')
            end

            for _, effect in pairs(technology.effects) do
                if effect.type == 'unlock-recipe' then
                    local recipe = recipes[effect.recipe]
                    if recipe.enabled ~= is_researched and is_enabled then
                        recipe.enabled = is_researched
                        log('-> for force: ' ..tostring(force.name).. ' state for recipe: "' ..tostring(recipe.name).. '" changed to "' ..tostring(is_researched).. '"')
                    elseif not is_enabled then
                        recipe.enabled = false
                        log('-> for force: ' ..tostring(force.name).. ' state for recipe: "' ..tostring(recipe.name).. '" changed to "false", technology is disabled.')
                    end
                end
            end

            if is_researched and not is_enabled then
                technology.researched = false
                technology.enabled = false
                log('-> for force: ' ..tostring(force.name).. ' state for: "' ..tostring(technology.name).. '" changed to "false", technology is disabled.')
            end
        end
    end
    log('Info: finished: check_technologies() for force: ' ..tostring(force.name))
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_recipes(force)
    log('Info: execute: check_recipes() for force: ' ..tostring(force.name))

    for _, surface in pairs(game.surfaces) do
        local entities = surface.find_entities_filtered({force=force, type={'assembling-machine', 'furnace'}})
        for _, entity in pairs(entities) do
            local recipe = entity.get_recipe()
            if recipe and not recipe.enabled and not starts_with(recipe.name, 'creative-') then
                log('-> removed recipe: "' ..tostring(recipe.name).. '" from "' ..tostring(entity.name).. '" at position: ' ..tostring(entity.position.x) .. ',' ..tostring(entity.position.y))
                entity.set_recipe(nil)
            end
        end
    end

    log('Info: finished: check_recipes() for force: ' ..tostring(force.name))
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function init.run()
    log('-------------------------------------------------------------')
    log('initial and update scripts')
    log('-------------------------------------------------------------')
    --game.reload_script()

    local excluded_forces = {['enemy'] = true, ['neutral'] = true}

    for _, force in pairs(game.forces) do
        if not excluded_forces[force.name] then
            force.reset_recipes()
            force.reset_technologies()
            --force.reset_technology_effects()
            activate_technologies_conditional_recipes(force)
            activate_technologies_conditional(force)
            check_technologies(force)
            check_recipes(force)
        end
    end
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return init
