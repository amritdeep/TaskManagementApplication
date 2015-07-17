class User < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :users
	# has_and_belongs_to_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end