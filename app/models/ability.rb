class Ability
  include CanCan::Ability

  def initialize(professor)
    professor ||= Professor.new # guest user (not logged in)
    if professor.admin?
      can :manage, :all
    else
      can :read, :all
    end

  # case professor
  # when Admin
  #   can :manage, :all
  # when User
  #   can :create, Comment
  #   can :read, :all
  # else
  #   can :read, :all
  # end
  end
end
