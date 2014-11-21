class PhotosController < ApplicationController
	before_action :current_user
	before_action :confirm_logged_in, only: [:new, :create, :edit, :show]
  

  def index
    @photos = Photo.all
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.create(photo_params)
    if @photo.save
      # split the url 
      # make an api call to 
      # https://api.uploadcare.com/files/#{uuid}
      # save the width and height to the DB
      photo_meta_data = HTTParty.get("#{@photo.url}-/json/")
      @photo.update_attributes(width: photo_meta_data["width"], height: photo_meta_data["height"])

      flash[:success] = "Photo created"
      redirect_to photos_path
    else
      render :new
    end
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    if @photo.save
      flash[:success] = "Photo successfully updated"
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    flash[:success] = "Photo deleted"
    redirect_to home_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :url, :price)
  end
end
