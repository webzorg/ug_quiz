json.semester do
  json.pk @semester.id
  json.year @semester.year
  json.academicterm @semester.academicterm

  # groups
  json.groups @semester.groups do |group|
    json.group_id group.group_id

    # course info
    json.course_code group.course.course_code
    json.course_name group.course.course_name
    json.course_name_concat group.course.course_name_concat
    # professor info
    json.professor_name group.professor.name
    json.professor_id group.professor.professor_id

    # students
    json.students group.students do |student|
      json.student_id student.id
      json.student_name student.name

      # attempts
      json.attempts student.attempts do |attempt|
        json.quiz_id attempt.quiz_permutation.quiz.id
        json.quiz_permutation_id attempt.quiz_permutation.id
        json.attempt_id attempt.id
        json.quiz_max_score attempt.quiz_permutation.quiz.total_possible_weight
        json.attempt_score attempt.score
        json.attempt_completed attempt.completed
      end
    end

  end
end
