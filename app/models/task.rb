class Task < ActiveRecord::Base
	belongs_to :user

  	validates :title, presence: true, uniqueness: true
  	validates :description, presence: true

end
