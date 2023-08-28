# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= AdminUser.new
    if user.role == 'Admin'
       can :access, :rails_admin   
       can :manage, :all
    elsif user.role == 'Scheduler'
       can :access, :rails_admin   
       can :read, Appointment
       can :update, Appointment
    end  
  end
end
