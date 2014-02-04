# == Schema Information
#
# Table name: solutions
#
#  id          :integer          not null, primary key
#  move_string :string(255)
#  score       :integer
#  solver_id   :integer          not null
#  exercise_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Solution < ActiveRecord::Base
  attr_accessible :move_string, :score
  
  belongs_to :solver, :class_name => 'User', :foreign_key => 'solver_id'
  belongs_to :exercise
  has_many :comments, as: :commentable
end
