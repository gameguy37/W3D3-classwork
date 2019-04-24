class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    belongs_to :prereq, #Called on Ruby 102. Ruby 101 belongs_to Ruby 102 as a prereq, which makes not a ton of sense
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course

    belongs_to :instructor, #Called on Ruby 102. Ned belongs_to Ruby 102. belongs_to doesn't imply ownership, it's more like belongs_to a set of something
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

end
