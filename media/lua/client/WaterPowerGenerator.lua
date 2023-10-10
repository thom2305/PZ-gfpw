WaterPowerGenerator = WaterPowerGenerator or {};

--localfunctions/helpers

function WaterPowerGenerator:gameIsSP()
    return isClient() == false;
end

local function setPowerAndWaterStates(powerState, waterState)
    WaterPowerGenerator:toggle("power", powerState)
    WaterPowerGenerator:toggle("water", waterState)
end

local function OnGameStart()
    setPowerAndWaterStates("on", "on")
end
--events

Events.OnGameStart.Add(OnGameStart)

--main function

function WaterPowerGenerator:toggle(which, state)
    local options = SandboxOptions.new();

    if state == "on" or state == "off"
    then
        options:copyValuesFrom(getSandboxOptions());
        options:getOptionByName(WaterPowerGenerator:getOptionName(which)):setValue(state == "on"
            and 2147483647
            or -1
        );
    end

    if WaterPowerGenerator:gameIsSP()
    then
        getSandboxOptions():copyValuesFrom(options);
        getSandboxOptions():toLua();
    else
        options:sendToServer();
    end
end

