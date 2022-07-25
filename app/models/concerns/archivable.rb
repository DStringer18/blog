module Archivable
  extend ActiveSupport::Concern

  def archived?
    !archived_at.nil?
  end

  def archive!(now = Time.now)
    update!(archived_at: now)
  end

  def unarchive!
    update!(archived_at: nil)
  end

end