class UsersController < ApplicationController

  def show
    
    @matching_user = User.where({ :username => params.fetch("a_user")}).at(0)

    if @matching_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show"})
    end
  end
  
  def index
    
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc})

    render({ :template => "user_templates/index"})
  end
end
