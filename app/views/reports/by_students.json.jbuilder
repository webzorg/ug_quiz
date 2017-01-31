json.students @students do |student|
  json.student_id student.id
  json.student_name student.name

  # attempts
  json.attempts student.attempts do |attempt|
    json.attempt_id attempt.id
    json.attempt_score attempt.score
    json.attempt_completed attempt.completed

    # quiz info
    json.quiz_id attempt.quiz_permutation.quiz.id
    json.quiz_permutation_id attempt.quiz_permutation.id
    json.quiz_max_score attempt.quiz_permutation.quiz.total_possible_weight

    # belongs_to
    json.belongs_to do
      group = attempt.quiz_permutation.group
      json.group do
        json.group_id group.group_id
        json.group_name group.name
      end

      professor = attempt.quiz_permutation.group.professor
      json.professor do
        json.professon_name professor.name
        json.professon_email professor.email
        json.professon_admin professor.admin
      end

      course = attempt.quiz_permutation.group.courses_semester.course
      json.course do
        json.course_name course.course_name
        json.course_code course.course_code
      end
    end # belongs_to
  end # attempts
end # students
