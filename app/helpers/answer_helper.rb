module AnswerHelper

  def find_question_by_answer(user)
    answers = Answer.where(:user_id => user.id)
    answers.each do |answer|
      @answer_question = answer.question 
    end
  end

  def question_by_answer_query
    @answer_question.query
  end
  
  def question_by_answer_count
    @answer_question.answers_count
  end
  
  def question_by_answer_no_count
    @answer_question.no_count
  end

  def question_by_answer_yes_count
    @answer_question.yes_count
  end

  def question_by_answer_winner
    @answer_question.winner
  end


end
