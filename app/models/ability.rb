class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new

    # default permission
    can :read, [Report, Group]
    cannot [:create, :update, :destroy], [Report, Group]
    cannot :show, Report

    if user.admin?
      can :access, :rails_admin
      can :manage, :all
    end

    # ログインしている場合
    if user.id?
      can :create, Report
      can :show, Report, user: user
      # 同じグループに所属するユーザの日報はアクセス可能
      can :show, Report, user: { group: user.group }, private: false
      can [:create, :set, :leave], Group
      # 作成者は更新と削除が可能
      can [:update, :destroy], [Report, Group], user_id: user.id
    end
  end
end
