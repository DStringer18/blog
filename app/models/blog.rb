class Blog < ApplicationRecord
  include Archivable

  has_many :comments
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def date_display
    created_at.strftime("%B %e, %Y")
  end
end
