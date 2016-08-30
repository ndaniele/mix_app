module QuestionsHelper

   def most_popular
    q_ids = []
    Answer.all.each do |answer|
      q_ids << answer.question_id
    end
      q_ids.group_by(&:itself).values.max_by(&:size).first
  end

end
