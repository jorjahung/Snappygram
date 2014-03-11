class Snap < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_and_belongs_to_many :tags

  self.per_page = 10

  def model
    EXIFR::JPEG.new(self.image.path).model
  end

  def taken_on
    if EXIFR::JPEG.new(self.image.path).date_time
      time = EXIFR::JPEG.new(self.image.path).date_time
      time.strftime("%e %B %Y at %R")
    else
      nil
    end
  end
end
