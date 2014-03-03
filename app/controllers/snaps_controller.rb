class SnapsController < ApplicationController
  def index
    @snaps = Snap.all(:order => "created_at DESC")
  end

  def new
    @snap = Snap.new
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
