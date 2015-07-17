class Task < ActiveRecord::Base
  # belongs_to :user

  has_and_belongs_to_many :users

  # scope :desc, order(created_at: :desc)

  def self.user_name(id)
  	User.where(id: id)
  end
  
end
