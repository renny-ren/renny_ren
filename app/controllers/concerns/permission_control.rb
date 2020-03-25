module PermissionControl
  extend ActiveSupport::Concern

  def admin?
    current_ability.admin?
  end
end