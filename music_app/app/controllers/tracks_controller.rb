class TracksController < ApplicationController
  def index
  end
  
  def show
    @track = Track.find(params[:id])
    render :show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
