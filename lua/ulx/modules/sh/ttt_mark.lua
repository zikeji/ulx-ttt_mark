if CLIENT then

    function ulx.cl_ttt_mark( target, tag )
        if not target then
            local current, vague = RADIO:GetTarget() --see cl_voice.lua, "current" won't be valid if disguised, dead
            print(current)
            print(vague)
            if vague then return end
            target = current
        end
        
        target.sb_tag = tag
    end

end

function ulx.ttt_mark( calling_ply, mark_type, target )
    if not calling_ply:IsValid() then
        return
    end

    if target == calling_ply then -- this means they didn't specify a target
        target = nil
    end

    -- because tags in sb_info.lua is local we have to redeclare them - bah!
    local tag = nil

    if mark_type == "friendly" then tag = {txt="sb_tag_friend", color=COLOR_GREEN}
    elseif mark_type == "suspicious" then tag = {txt="sb_tag_susp",   color=COLOR_YELLOW}
    elseif mark_type == "avoid" then tag = {txt="sb_tag_avoid",  color=Color(255, 150, 0, 255)}
    elseif mark_type == "kill" then tag = {txt="sb_tag_kill",   color=COLOR_RED}
    elseif mark_type == "missing" then tag = {txt="sb_tag_miss",   color=Color(130, 190, 130, 255)}
    else return
    end
    
    ULib.clientRPC( calling_ply, "ulx.cl_ttt_mark", target, tag )
end

local ttt_mark = ulx.command( "TTT Utility", "ulx mark", ulx.ttt_mark, {"!mark"} )
ttt_mark:addParam{ type=ULib.cmds.StringArg, help="label", completes={"friendly", "suspicious", "avoid", "kill", "missing"}, ULib.cmds.restrictToCompletes }
ttt_mark:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
ttt_mark:defaultAccess( ULib.ACCESS_ALL )
ttt_mark:help( "Marks the targeted player." )