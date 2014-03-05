require 'spec_helper'

describe SnapsController do

  describe "Creating Snaps" do
    it "should load new snaps through Pusher" do
      expect(Pusher["Snappygram"]).to receive(:trigger)
      post :create, :snap => {description: "Pizzaaaaaa", image: fixture_file_upload('first_snap.jpg', 'image/jpg')}
    end
  end

end
