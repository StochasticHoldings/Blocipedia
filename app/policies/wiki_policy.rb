class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.standard? || user.premium? || user.admin?
  end

  def edit?
    user.present?
  end

  def destroy?
    record.user == user
  end
end
