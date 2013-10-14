class BandsController < ApplicationController
  def index
  end
  
  def show
    @band = Band.find(params[:id])
    render :show
  end
  
  def new
    render :new
  end
  
  def create
    @band = Band.new(params["band"])
    
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
