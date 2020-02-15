class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.cinema.user == user
  end

  def new?
    record.cinema.user == user
  end

  def destroy?
    record.cinema.user == user
  end
end
