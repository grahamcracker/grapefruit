# == Schema Information
#
# Table name: assignment_types
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  default_point_value :float(24)
#  drops_lowest        :boolean
#  percentage          :float(24)
#  course_id           :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class AssignmentType < ActiveRecord::Base

  belongs_to :course
  has_many :assignments

end
