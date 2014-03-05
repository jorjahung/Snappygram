class SnapsController < ApplicationController
  def index
    @snaps = Snap.order("created_at DESC")
  end

  def new
    if user_signed_in? 
      @snap = Snap.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    snap = Snap.new( snap_params )
    snap.user = current_user
    snap.save
    Pusher.url = "http://54588be462ee98f5db66:e51138c2fdbb0e8e0ac7@api.pusherapp.com/apps/67764"
    Pusher.trigger("Snappygram", "new_snap", { src: snap.image.url(:medium), 
                                               description: snap.description })
    redirect_to root_path
  end


  private

  def snap_params
    params.require(:snap).permit(:description, :image)
  end
end
