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
        cannot :update, Quiz, Quiz do |quiz|
          user.groups.map(&:id).exclude?(quiz.group_id)
        end
        cannot :destroy, Professor, admin: user.admin
      end
    when Student
      can :index, Attempt
      can :edit, Attempt
      can :update, Attempt
    end
  end
end
