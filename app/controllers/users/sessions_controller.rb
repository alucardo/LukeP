class Users::SessionsController < Devise::SessionsController

  def signed_in_root_path(resource_or_scope)
    admin_user_path resource_or_scope
  end
end
