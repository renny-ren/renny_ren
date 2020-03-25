# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(token)
    @token = token

    if admin?
      can :manage, :all
    else
      can :read, :all
    end
  end

  def admin?
    @token == Settings.admin_token
  end
end
