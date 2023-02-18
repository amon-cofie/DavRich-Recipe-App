class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    cannot :read, Recipe, public: false
    return unless user.present?

    can(:manage, Recipe, user:)
    can(:manage, Food, user:)
    can(:manage, RecipeFood, user:)
    # return unless user.role == 'admin'

    can :manage, :all
  end
end
