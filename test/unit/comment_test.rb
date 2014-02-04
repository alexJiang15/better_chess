# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  author_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
