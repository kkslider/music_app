class TracksController < ApplicationController
  before_filter :require_logged_in!
  
  def index
  end
  
  def show
    @track = Track.find(params[:id])
    render :show
  end
  
  def new
    @albums = Album.all
    render :new
  end
  
  def create
    @track = Track.new(params["track"])
    
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      # is just rendering the template, :new has access to @track
      render :new
    end
  end
  
  def edit
    @albums = Album.all
    render :edit
  end
  
  def update
  end
  
  def destroy
    Track.delete(params[:id])
  end
  
  private
  
  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
