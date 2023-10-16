wpg = wpg or {};

--localfunctions/helpers


--events

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
end

