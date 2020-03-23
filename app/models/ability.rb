# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(token)
    if token == Settings.admin_token
      can :manage, :all
    else
      can :read, :all
    end
  end
end
