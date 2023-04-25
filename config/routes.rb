Rails.application.routes.draw do
#HOMEPAGE ROUTE
get("/", {:controller => "users", :action => "index"})

#USERS ROUTES
get("/users", {:controller => "users", :action => "index"})
get("/users/:path_username", {:controller => "users", :action => "show"})
get("/insert_user", {:controller => "users", :action => "create"})
get("/update_user/:modify_user", {:controller => "users", :action => "update"})

#PHOTOS ROUTES
get("/photos", {:controller => "photos", :action => "index"})
get("/photos/:path_id", {:controller => "photos", :action => "show"})
get("/delete_photo/:burn_id", {:controller => "photos", :action => "delete"})
get("/insert_photo", {:controller => "photos", :action => "create" })
get("/update_photo/:modify_id", {:controller => "photos", :action => "update"})
get("/insert_comment_record", {:controller => "photos", :action => "comment"})
end
