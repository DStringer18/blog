class Copy < ApplicationRecord
  include Archivable

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def date_display
    created_at.strftime("%B %e, %Y")
  end
end
