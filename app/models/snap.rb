class Snap < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_and_belongs_to_many :tags

  self.per_page = 10

  def model
    @model ||= EXIFR::JPEG.new(self.image.path).model
  end

  def taken_on
    if EXIFR::JPEG.new(self.image.path).date_time
      time = EXIFR::JPEG.new(self.image.path).date_time
      time.strftime("%e %B %Y at %R")
    else
      nil
    end
  end

  def location
    city + ", " + country
  rescue
    locality + ", " + country
  end

  def locality
    reverse_geocoding["results"][0]["address_components"].select { |h| h["types"].include? ("locality") }[0]["long_name"]
  end

  def city
    reverse_geocoding["results"][0]["address_components"].select { |h| h["types"].include? ("postal_town") }[0]["long_name"]
  end

  def country
    reverse_geocoding["results"][0]["address_components"].select { |h| h["types"].include? "country" }[0]["long_name"]
  end

  def reverse_geocoding
    @response ||= HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{self.latlong}&sensor=false&key=#{ENV['GOOGLE_API_KEY']}")
  end

  def can_use_exif?
    self.image_content_type == "image/jpeg"
  end

  def has_gps?
    EXIFR::JPEG.new(self.image.path).gps
  end

  def latlong
    latitude.to_s + "," + longitude.to_s
  end
  
  def longitude
    @long ||= EXIFR::JPEG.new(self.image.path).gps.longitude
  end

  def latitude
    @lat ||= EXIFR::JPEG.new(self.image.path).gps.latitude
  end
end
