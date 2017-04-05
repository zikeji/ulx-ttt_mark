if CLIENT then

    function ulx.cl_ttt_mark( target, mark_type )
        if not target then
            local current, vague = RADIO:GetTarget() --see cl_voice.lua, "current" won't be valid if disguised, dead
            print(current)
            print(vague)
            if vague then return end
            target = current
        end

        local tags = { --found in sb_info.lua, because it is local we unfortunately have to redeclare them
            {txt="sb_tag_friend", color=COLOR_GREEN},
            {txt="sb_tag_susp",   color=COLOR_YELLOW},
            {txt="sb_tag_avoid",  color=Color(255, 150, 0, 255)},
            {txt="sb_tag_kill",   color=COLOR_RED},
            {txt="sb_tag_miss",   color=Color(130, 190, 130, 255)}
        }

        local mark_types = {
            {mark_type="f", tag=tags[1]},
            {mark_type="friend", tag=tags[1]},
            {mark_type="friendly", tag=tags[1]},

            {mark_type="s", tag=tags[2]},
            {mark_type="susp", tag=tags[2]},
            {mark_type="suspicious", tag=tags[2]},

            {mark_type="a", tag=tags[3]},
            {mark_type="avoid", tag=tags[3]},

            {mark_type="k", tag=tags[4]},
            {mark_type="kill", tag=tags[4]},

            {mark_type="m", tag=tags[5]},
            {mark_type="miss", tag=tags[5]},
            {mark_type="missing", tag=tags[5]}
        }

        local tag = nil

        for i,v in ipairs(mark_types) do
            if v.mark_type == mark_type then
                target.sb_tag = v.tag
                print(v.tag)
                break
            end
        end
    end

end

function ulx.ttt_mark( calling_ply, mark_type, target )
    if not calling_ply:IsValid() then
        return
    end

    if target == calling_ply then -- this means they didn't specify a target
        target = nil
    end
    
    ULib.clientRPC( calling_ply, "ulx.cl_ttt_mark", target, mark_type )
end

local ttt_mark = ulx.command( "TTT Utility", "ulx mark", ulx.ttt_mark, {"!mark"} )
ttt_mark:addParam{ type=ULib.cmds.StringArg, help="label", completes={"friendly", "suspicious", "avoid", "kill", "missing"} }
ttt_mark:addParam{ type=ULib.cmds.PlayerArg, ULib.cmds.optional }
ttt_mark:defaultAccess( ULib.ACCESS_ALL )
ttt_mark:help( "Marks the targeted player." )