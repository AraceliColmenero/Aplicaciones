require 'awesome_print'

class User
  attr_reader :personal_info,:contact_info, :role

  def initialize(personal_info, contact_info, role)
    @personal_info=personal_info
    @contact_info=contact_info
    @role= role
  end


end

class Role
  attr_reader :permissions
  def initialize(*permissions)
    @permissions = permissions
  end
  def add_permissions(permission)
    @permissions << permission
  end
  def permissions_for(key)
    @permissions.include? key
  end
end
