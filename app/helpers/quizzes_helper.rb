module QuizzesHelper
  def total_weight(quiz)
    quiz.questions.inject(0) { |acc, elem| acc + elem.question_category.weight.to_f }
  end
end
