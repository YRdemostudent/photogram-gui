class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "layouts/users"})
  end
end
