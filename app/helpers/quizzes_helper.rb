module QuizzesHelper
  def total_weight(quiz)
    quiz.questions.reduce(0) { |sum, question| sum + question.weight.to_f }
  end
end
