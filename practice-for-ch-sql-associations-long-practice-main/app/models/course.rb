# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments

    has_many :enrolled_students,
    through: :enrollments,
    source: :student

    belongs_to :prerequisite,
    foreign_key: :prereq_id,
    class_name: :Course,
    optional: true

    belongs_to :instructor,
    class_name: :User
end
