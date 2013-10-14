class TracksController < ApplicationController
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
  end
  
  def edit
    @albums = Album.all
    render :edit
  end
  
  def update
  end
  
  def destroy
  end
end
