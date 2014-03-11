require 'spec_helper'

describe Snap do
  it "should know the model of camera which took the snap (if any)" do
    snap = Snap.new
    String.any_instance.stub(model: 'iPhone 5')
    expect(EXIFR::JPEG).to receive(:new).and_return("EXIF data")
    expect(snap.model).to eq("iPhone 5")
  end

  it "should know the date the snap was taken on (if available)" do
    snap = Snap.new
    String.any_instance.stub(date_time: Time.new(2014,03,11,8,30))
    expect(EXIFR::JPEG).to receive(:new).twice.and_return("EXIF data")
    expect(snap.taken_on).to eq("11 March 2014 at 08:30")
  end
end
