# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  tag           :string(255)      not null
#  votes         :integer          default(0)
#  taggable_id   :integer
#  taggable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class TagsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
