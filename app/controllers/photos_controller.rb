class PhotosController < ApplicationController

  def destroy
    the_id = params.fetch("a_photo")
    
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")
  end

  def show

    @matching_photo = Photo.where({ :id => params.fetch("a_photo")}).at(0)
    if @matching_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photos_templates/show"})
    end
  end
  
  def index
    
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({ :template => "photos_templates/index"})
  end
end
