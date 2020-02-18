module ApplicationHelper
  def get_decision(q)
    max = 0
    most_choice_name = "" 
    q.choices.each do |c|
      if max < c.votes.length
        most_choice_name = c.name
        max = c.votes.length
      end
    end
    most_choice_name
  end
end
