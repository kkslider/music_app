class AlbumsController < ApplicationController
  before_filter :require_logged_in!
  
  def index
  end
  
  def show
    @album = Album.find(params[:id])
    render :show
  end
  
  def new
    @bands = Band.all
    render :new
  end
  
  def create
    @album = Album.new(params["album"])
    @album.band_id = params[:band_id]
    
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end
  
  def edit
    @album = Album.find(params[:id])
    render :edit
  end
  
  def update
  end
  
  def destroy
    Album.delete(params[:id])
    # redirect_to 
  end
  
  private
  
  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
