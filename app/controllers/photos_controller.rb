class PhotosController < ApplicationController
def index

  matching_photos = Photo.all
  @list_of_photos = matching_photos.order({:created_at => :desc })

  render(:template => "photo_templates/index.html.erb")
end

def show
  #Parameters: {"path_id"=>"777"}to guide me in my params

  url_id = params.fetch("path_id")
  
  matching_photos = Photo.where({:id => url_id })
  @the_photo = matching_photos.at(0)

  render(:template => "photo_templates/show.html.erb")
end 

def delete 
#Parameters: {"burn_id"=>"777"}
the_id = params.fetch("burn_id")

matching_photos = Photo.where({:id => the_id})
the_photo = matching_photos.at(0)

the_photo.destroy

 #render(:template => "photo_templates/delete.html.erb")
 redirect_to("/photos")
end

def create
#Parameters: {"query_image"=>"an", "query_caption"=>"booo", "query_owner_id"=>"1"}Parameters: {"query_image"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIgMRtbqu6hvSxZvbTvqcyxr-yCW5ayY_5vIkKwV299A&usqp=CAU&ec=48600112", "query_caption"=>"Life proof boats", "query_owner_id"=>"111"}
input_image = params.fetch("query_image")
input_caption = params.fetch("query_caption")
input_owner_id = params.fetch("query_owner_id")

a_new_photo = Photo.new

a_new_photo.image = input_image
a_new_photo.caption = input_caption
a_new_photo.owner_id = input_owner_id

a_new_photo.save

#render(:template => "photo_templates/create.html.erb")

redirect_to("/photos/" + a_new_photo.id.to_s)
end 

def update
  the_id = params.fetch("modify_id")
  matching_photos = Photo.where({:id=>the_id})
  the_photo = matching_photos.at(0)

  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  
  the_photo.image = input_image
  the_photo.caption  = input_caption

  the_photo.save
  next_url = "/photos/" + the_photo.id.to_s
  redirect_to(next_url)
  # render({:template => "photos_templates/update.html.erb"})
end

def comment
  input_body = params.fetch("input_body")
  input_author_id = params.fetch("input_author_id")
  input_photo_id = params.fetch("input_photo_id")

  a_new_comment = Comment.new
  a_new_comment.author_id = input_author_id
  a_new_comment.body = input_body
  a_new_comment.photo_id = input_photo_id
  a_new_comment.save

  redirect_to("/photos/" + a_new_comment.id.to_s)
end

end 
