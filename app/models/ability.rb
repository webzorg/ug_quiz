class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when Professor
      # can :read, :all

      if user.admin?
        can :manage, :all

        cannot :destroy, Professor, admin: user.admin
        cannot :create, Semester
      end
    when Student
      can :read, :all
    end
  end
end
