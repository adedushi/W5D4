class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :submitter_id, presence: true

  after_initialize if: :new_record? do
    self.short_url = generate_short_url
  end

  belongs_to :submitter, class_name: :User

  has_many :visits, 
  through: :visitors,
  source: :visitor
  
  def self.random_code
    random_code = SecureRandom.urlsafe_base64(3)
    random_code = SecureRandom.urlsafe_base64(3) while exists?(short_url: random_code)
    random_code
  end

  private

  def generate_short_url
    "stinkyshort.com/#{ShortenedUrl.random_code}"
  end
end
