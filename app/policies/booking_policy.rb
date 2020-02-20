class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # index, show, new, create, edit update

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
