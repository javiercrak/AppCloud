class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.name?
      #can :manage, :all
      #Allow user to edit data
      can :edit, User do |us|
        us==user
      end
      can :update, User do |us|
        us==user
      end
      can :show, User do |us|
        us==user
      end
      #Allow contest of user
      can :edit, Contest do |contest|
        contest.user==user
      end

      can :update, Contest do |contest|
        contest.user==user
      end
      can :destroy, Contest do |contest|
        contest.user==user
      end
      can :create, Contest
      #can :show, Contest do |cont|
        #cont(:user)==user
     # end
     # can :index, Contest do |cont|
    #    cont(:user)==user
    #  end
    else
      #can :read, :all

      #can :update, Comment do |comment|
        #comment.try(:user) == user || user.role?(:moderator)
      end
    can :create, User
    can :show, Contest
    can :index, Contest
    can :preview, Contest
  end
end
