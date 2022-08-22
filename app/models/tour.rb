class Tour < ApplicationRecord
  include Archivable

  has_one_attached :image, dependent: :destroy do |attachable|
    attachable.variant :header, resize_to_limit: [400, 400]
    attachable.variant :thumb, resize_to_limit: [400, 400]
  end
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
