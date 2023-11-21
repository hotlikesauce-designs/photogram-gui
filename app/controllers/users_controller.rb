class UsersController < ApplicationController

  def update
    @matching_user = User.where({ :id => params.fetch("a_user")}).first
    
    @matching_user.username = params.fetch("input_username")
    
    @matching_user.save
    
    redirect_to("/users/#{@matching_user.username}")

  end
  
  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    
    @new_user.save
    
    redirect_to("/users/#{params.fetch("input_username")}")
  end

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
