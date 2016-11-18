class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when Professor
      can :manage, Quiz
      can :manage, Group, professor_id: user.id
      can :read, Professor
      can [:read, :update], user
      if user.admin?
        can :manage, :all
        cannot :destroy, Professor, admin: user.admin
      end
    when Student
      can :read, Attempt
      can :create, Attempt
    end
  end
end
