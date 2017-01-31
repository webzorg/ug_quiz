json.semester do
  json.id @semester.id
  json.year @semester.year
  json.academicterm @semester.academicterm

  # courses_semesters
  json.courses @semester.courses_semesters.each do |courses_semester|
    # course info
    json.course_code courses_semester.course.course_code
    json.course_name courses_semester.course.course_name
    json.course_name_concat courses_semester.course.course_name_concat

    # groups
    json.groups courses_semester.groups do |group|
      json.group_id group.group_id

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
        end # attempts
      end # students
    end # groups
  end # courses_semesters
end # semester
