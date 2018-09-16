class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    # Define User abilities
    if user.is? :admin
        can :manage, :all 

    elsif user.is? :user
        
        can :manage, User, id: user.id
        can :manage, DesideredBook, user_id: user.id
        can :manage, ProposedBook, user_id: user.id
        can :read, ProposedBook
        can :read, DesideredBook
        can :manage, Proposal
        can :manage, Exchange
        can :create, UserReview
        can :read, UserReview
        can :create, Report, Contact
    else
        cannot :create, ProposedBook
        cannot :create, DesideredBook
        cannot :create, UserReview
        can :read, User
        can :read, UserReview
        can :read, ProposedBook
        can :read, DesideredBook
    end
  end
end
