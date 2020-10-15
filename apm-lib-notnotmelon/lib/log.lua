local loglevel_setting = settings.startup["apm_lib_log_level"].value

local loglevel = 0
if loglevel_setting == '0: Error' then loglevel = 0 end
if loglevel_setting == '1: Warning' then loglevel = 1 end
if loglevel_setting == '2: Info' then loglevel = 2 end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_ERR(caller, func, msg)
    if loglevel >= 0 then
        log('Error: ' ..caller.. ' -> ' ..func.. ': ' ..msg)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_DEPR(caller, func, msg)
    if loglevel >= 0 then
        log('Deprecated: ' ..caller.. ' -> ' ..func.. ': ' ..msg)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_WARN(caller, func, msg)
    if loglevel >= 1 then
        log('Warning: ' ..caller.. ' -> ' ..func.. ': ' ..msg)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_INFO(caller, func, msg)
    if loglevel >= 2 then
        log('Info: ' ..caller.. ' -> ' ..func.. ': ' ..msg)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_HEADER(path)
    if loglevel >= 2 then
        log('- Info ------------------------------------------------')
        log(tostring(path))
        log('-------------------------------------------------------')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function APM_LOG_SETTINGS(caller, name,  value)
    if loglevel >= 2 then
        log('Setting: ' ..caller.. ': ' ..name.. ' -> ' ..tostring(value))
    end
end