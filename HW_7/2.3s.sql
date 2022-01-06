update Students
set GroupId =
        case GroupId
            when :FromGroupId then :GroupId
            else GroupId
            end