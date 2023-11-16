class Visit < ApplicationRecord
    validates :url_id, :visitor_id, presence: true

    belongs_to :visitor, class_name: :User

    belongs_to :url, class_name: :ShortenedUrl
end
