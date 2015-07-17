class Task < ActiveRecord::Base
  belongs_to :user

  # scope :desc, order(created_at: :desc)
end
