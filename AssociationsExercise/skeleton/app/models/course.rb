class Course < ActiveRecord::Base
  has_many(
    :enrollments,
    class_name: "Enrollment",
    primary_key: :id,
    foreign_key: :course_id
  )

  has_one(
    :prerequisite,
    class_name: "Course",
    primary_key: :prereq_id,
    foreign_key: :id
  )

  has_one(
    :instructor,
    class_name: "User",
    primary_key: :instructor_id,
    foreign_key: :id
  )

  has_many(
    :enrolled_students,
    through: :enrollments,
    source: :user
  )
end
