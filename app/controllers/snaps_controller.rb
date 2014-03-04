class SnapsController < ApplicationController
  def index
    @snaps = Snap.all(:order => "created_at DESC")
  end

  def new
    if user_signed_in? 
      @snap = Snap.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    Snap.create( snap_params )
    redirect_to root_path
  end


  private

  def snap_params
    params.require(:snap).permit(:description, :image)
  end
end
