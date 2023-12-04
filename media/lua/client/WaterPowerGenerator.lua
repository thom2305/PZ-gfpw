 wpg = wpg or {};

--localfunctions/helpers

--events

--main function

function wpg:toggle(which, state)
    local options = SandboxOptions.new();

    if state == "on" or state == "off"
    then
        options:copyValuesFrom(getSandboxOptions());
        options:getOptionByName(wpg:getopnm(which)):setValue(state == "on"
            and 2147483647
            or -1
        );
    end

    if wpg:gamesp() then
        getSandboxOptions():copyValuesFrom(options);
        getSandboxOptions():toLua();
    else
        options:sendToServer();
    end
end 

--helpers
function wpg:gamesp()
    return isClient() == false;
end

function wpg:getopnm(which)
    return (which == "power"
        and "ElecShut"
        or "WaterShut"
    ) .. "Modifier";
end