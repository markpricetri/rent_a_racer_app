class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def create?
    return true
  end

  def update?
    return true
  end
  
end
