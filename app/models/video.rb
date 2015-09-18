class Video < ActiveRecord::Base
  belongs_to :contest
  validates :contest_id, presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: {maximum: 50}
  validates :message, length: { maximum: 1000 } , presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_attached_file :video,
                    :path => "public/system/:class/:id/:filename",
                    :url => "/system/:class/:id/:basename.:extension"
end
