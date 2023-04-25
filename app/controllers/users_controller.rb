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
end
