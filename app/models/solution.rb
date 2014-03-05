# == Schema Information
#
# Table name: solutions
#
#  id          :integer          not null, primary key
#  move_string :string(255)
#  score       :integer
#  user_id     :integer          not null
#  exercise_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Solution < ActiveRecord::Base
  attr_accessible :move_string, :score, :user_id, :exercise_id # **** DANGEROUS!!!!
  
  belongs_to :user
  belongs_to :exercise
  has_many :comments, as: :commentable
  
  validates :user_id, presence: true
  validates :exercise_id, presence: true
  
  default_scope order: 'solutions.created_at DESC'
end
