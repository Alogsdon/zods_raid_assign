MAY GET USED

	if (not ZRA_vars.schema_version) or ZRA_vars.schema_version < ZRA.schema_version then
		ZRA.wipeVars()
		ZRA_vars.schema_version = ZRA.schema_version
	end


#hooking to nab last companions
local lastCompanionType, lastCompanionIndex; -- (1)
local function postHook(typeID, index, ...) -- (2)
 lastCompanionType, lastCompanionIndex = typeID, index; -- (3)
 return ...; -- (4)
end
local oldPickupCompanion = PickupCompanion;
function PickupCompanion(...)
 local typeID, index = ...; 
 return postHook(typeID, index, oldPickupCompanion(typeID, index, ...)); 
end