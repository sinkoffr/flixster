class User < ApplicationRecord
  has_many :courses
  has_many :enrollements
  has_many :enrolled_courses, through: :enrollements, source: :course
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end
  
end
