require 'util'

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.debug.table(t)
    log('--- DEBUG: Table -----------------------------------')
    log('->: ' .. tostring(t))
    log(serpent.block( t, {comment = false, numformat = '%1.8g' } ))
end