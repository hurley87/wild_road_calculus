class Course < ActiveRecord::Base
	belongs_to :user
	has_many :lessons
	accepts_nested_attributes_for :lessons, :reject_if => :all_blank, allow_destroy: true
end
