class UsersController < ApplicationController

  def index
  #@list_of_users = ......

  matching_users = User.all
  @list_of_users = matching_users.order({:username => :asc })
    
  render(:template => "user_templates/index.html.erb" )
  end 

  def show
    #Parameters: {"path_username"=>"anisa"}
  url_username = params.fetch("path_username")
  matching_usernames = User.where({:username => url_username})
  
  @the_user = matching_usernames.at(0)

  # if @the_user == nil another way to do it, but you will need to put it in each class
  #   redirect_to("/404")
  # else 
    render(:template => "user_templates/show.html.erb")
    #end
  end 

  def create
  input_username = params.fetch("input_username")
  a_new_user = User.new
  a_new_user.username = input_username
  a_new_user.save

  #render(:template => "user_templates/create.html.erb")
  redirect_to("/users/#{a_new_user.username}")
  end 

  def update
    the_user = params.fetch("modify_user")
    matching_user = User.where({:username => the_user})
    current_user = matching_user.at(0)
    
    input_user = params.fetch("input_username")
    current_user.username = input_user
    current_user.save

    #render(:template => "user_templates/update.html.erb")
    redirect_to("/users/#{current_user.username}")
end

end
