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

require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
