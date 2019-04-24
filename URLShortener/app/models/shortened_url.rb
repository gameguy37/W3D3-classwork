# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :user_id, presence: true
    validates :short_url, uniqueness: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit

    has_many :visitors,
        through: :visits,
        source: :visitor

    def self.random_code
        code = SecureRandom::urlsafe_base64
        return code unless ShortenedUrl.exists?(short_url: code)
    end

    def self.make_new_url!(user, long_url)
        ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
    end
end
