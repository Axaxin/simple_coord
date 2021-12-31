local zone = nil
local TimeSinceLastUpdate = 0
local function UpdateCoordinates(self, elapsed)
    if zone ~= GetRealZoneText() then
	zone = GetRealZoneText()
  	SetMapToCurrentZone()
    end
     TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
 	if TimeSinceLastUpdate > .5 then	
     	TimeSinceLastUpdate = 0
   	    local posX, posY = GetPlayerMapPosition("player");		
 	    local x = math.floor(posX * 10000)/100
	    local y = math.floor(posY*10000)/100
	    eCoordinatesFontString:SetText("|c98FB98ff("..x..", "..y..")")	
 	end	
end
 
function eCoordinates_OnLoad(self, event,...) 
    self:RegisterEvent("ADDON_LOADED")	
end
function eCoordinates_OnEvent(self, event, ...) 
    if event == "ADDON_LOADED" and ... == "eCoordinates" then
        self:UnregisterEvent("ADDON_LOADED")		
	    eCoordinates:SetSize(100, 50)
            eCoordinates:SetPoint("TOP", "Minimap", "BOTTOM", 5, -5)
    	    eCoordinates:SetScript("OnUpdate", UpdateCoordinates)
	    local coordsFont = eCoordinates:CreateFontString("eCoordinatesFontString", "ARTWORK", "GameFontNormal")
 	    coordsFont:SetPoint("CENTER", "eCoordinates", "CENTER", 0, 0)
	    coordsFont:Show()
 	    eCoordinates:Show()		
	end
end