class Course < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions, dependent: :destroy
  validates :name, presence: true
  validates :time, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true 
end
