class SongPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def download_audio?
    true
  end
end
