class NotesController < ApplicationController
  def new
    @track = Track.find(params[:track_id])
    render :new
  end
  
  def create
    note = Note.new(params["note"])
    note.user_id = current_user.id
    track = Track.find(params[:track_id])
    note.track_id = track.id
    
    if note.save
      redirect_to track_url(track)
    else
      flash.now[:errors] = note.errors.full_messages
      render :new
    end
  end
  
  def destroy
    note = Note.find(params[:id])
    Note.delete(note)
    redirect_to track_url(Track.find(params[:track_id]))
  end
end