class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      #can :manage, :all
      can :update, User do |us|
        us.try(:user)==user
      end
      can :read, User do |us|
        us.try(:user)==user
      end
    else
      #can :read, :all

      #can :update, Comment do |comment|
        #comment.try(:user) == user || user.role?(:moderator)
      end
    can :create, User
  end
end
