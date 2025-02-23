class PhotosController < ApplicationController

  def add_comment
    
    @new_comment =  Comment.new

    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.author_id = params.fetch("input_author_id")
    @new_comment.body = params.fetch("input_comment")
    
    @new_comment.save

    redirect_to("/photos/#{params.fetch("input_photo_id")}", { :notice => "comment created successfully." })

  end
  
  def update
    
    the_photo_id = params.fetch("a_photo")

    @the_photo = Photo.where({ :id => the_photo_id }).first

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    
    @the_photo.save
    redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully." })

    # if @the_photo.valid?
    #   @the_photo.save
    #   redirect_to("/photos", { :notice => "Movie created successfully." })
    # else
    #   redirect_to("/photos", { :notice => "Movie failed to create successfully." })
    # end
  end

  def create
    
    @the_photo =  Photo.new

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.owner_id = params.fetch("input_owner_id")
    
    @the_photo.comments_count = 0
    @the_photo.likes_count = 0
    
    @the_photo.save
    redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo created successfully." })

    # if @the_photo.valid?
    #   @the_photo.save
    #   redirect_to("/photos", { :notice => "Movie created successfully." })
    # else
    #   redirect_to("/photos", { :notice => "Movie failed to create successfully." })
    # end
  end

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
