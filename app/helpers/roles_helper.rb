module RolesHelper
  def can_edit?(tip)
    case(current_user.role)
    when 'admin' then true
    when 'registered' then current_user == tip.user
    else false
    end
  end

  def can_manage_users?
    case(current_user.role)
    when 'admin' then true
    else false
    end
  end

  def is_owner?(user)
    case user.id
    when current_user.id then true
    else false
    end
  end
end
