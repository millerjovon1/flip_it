class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def update?
    user_is_owner? || user_is_admin?
  end

  def user_is_owner?
    record == user
  end

  def user_is_admin?
    user.admin?
  end
end
