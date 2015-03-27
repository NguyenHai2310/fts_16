class Option < ActiveRecord::Base
  belongs_to :course
  belongs_to :question  
end
