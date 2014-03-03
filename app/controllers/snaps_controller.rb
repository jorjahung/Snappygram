class SnapsController < ApplicationController
  def index
    @snaps = Snap.all
  end
end
