# == Schema Information
#
# Table name: visits
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Visit < ApplicationRecord
    validates :shortened_url_id, :user_id, presence: true

    belongs_to :visitor,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :shortened_url,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :ShortenedUrl


    def self.record_visit!(user, shortened_url)
        Visit.create!(user_id: user.id, shortened_url: shortened_url.id)
    end


end
