local f = CreateFrame("Frame", "ATAS_Frame", UIParent)
f:RegisterEvent("UPDATE_INSTANCE_INFO")
f:RegisterEvent("GROUP_LEFT")

local function ATAS_Frame_OnEvent(self, event, ...)
	if event == "GROUP_LEFT" then
		if IsInInstance() then
			C_CVar.SetCVar("softTargetEnemy","0")
			print(ATAS_softTargetEnemy_Disabled)
		end
	end
	if event == "UPDATE_INSTANCE_INFO" then
		if IsInInstance() and IsInGroup() then
			C_CVar.SetCVar("SoftTargetEnemy","3")
			print(ATAS_softTargetEnemy_Enabled)
		end
	end
end

function ATAS_cVar_Check()
	if IsInInstance() then
		C_CVar.SetCVar("softTargetEnemy","3")
		print(ATAS_softTargetEnemy_Enabled)
	else
		C_CVar.SetCVar("SoftTargetEnemy","0")
		print(ATAS_softTargetEnemy_Disabled)
	end
end

SLASH_ATAS1 = "/atas"
SlashCmdList["ATAS"] = ATAS_cVar_Check;

f:SetScript("OnEvent", ATAS_Frame_OnEvent)