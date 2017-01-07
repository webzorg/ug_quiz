# == Schema Information
#
# Table name: semesters
#
#  id           :integer          not null, primary key
#  year         :integer
#  academicterm :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
