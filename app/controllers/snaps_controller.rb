class SnapsController < ApplicationController
  def index
    # @snaps = Snap.order("created_at DESC")
    @snaps = Snap.order("created_at DESC").paginate(:page => params[:page])
    respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
  end

  def map
    @snaps = Snap.all.select { |snap| snap.can_use_exif? && snap.has_gps? }
  end

  def new
    if user_signed_in?
      @snap = Snap.new
    else
      redirect_to new_user_session_path
    end
  end

  def filter 
    @tag = Tag.find(params[:id])
    @snaps = Snap.order("created_at DESC").select { |snap| snap.tags.include? @tag }
  end

  def create
    # puts snap_params

    # puts our_params["tags"].split(' ')

    new_params = { description: snap_params[:description], image: snap_params[:image] }

    new_params[:tags] = snap_params[:tags].split(' ').map do |tag_text|
      Tag.find_or_create_by(text: tag_text)
    end

    # puts new_params

    snap = Snap.new( new_params )
    snap.user = current_user
    snap.save
    Pusher.url = "http://1460f55072d4b5c355e8:efe1c68aa43b5f454d4d@api.pusherapp.com/apps/67907"
    Pusher.trigger("Snappygram", "new_snap", { src: snap.image.url(:medium),
                                               username: snap.user.username,
                                               tags: snap.tags,
                                               description: snap.description })
    redirect_to root_path
  end

  def show
    @snap = Snap.find(params[:id])
  end

  private

  def snap_params
    params.require(:snap).permit(:description, :image, :tags)
  end
end
