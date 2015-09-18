class Contest < ActiveRecord::Base
  belongs_to :user
  has_many :videos, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, length: {maximum: 140}, presence: true, uniqueness: true
  validates :description, length: { maximum: 1000 } , presence: true
  validates :url, length: { maximum: 140 } , presence: true
  validates :startdate, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }, on: :create
  validates :enddate, presence: true, date: { :after_or_equal_to => :startdate}
  def data=(incoming_file)
    self.binary_data = incoming_file.read
    self.content_type = incoming_file.content_type
    self.filename = incoming_file.original_filename
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  private

  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
