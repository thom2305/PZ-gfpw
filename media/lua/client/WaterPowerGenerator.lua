 wpg = wpg or {};

--localfunctions/helpers

--events
adsada
--main function

function wpg:toggle(which, state)
    local options = SandboxOptions.new();

    if state == "on" or state == "off"
    then
        options:copyValuesFrom(getSandboxOptions());
        options:getOptionByName(wpg:getOptionName(which)):setValue(state == "on"
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
function wpg:gameIsSP()
    return isClient() == false;
end