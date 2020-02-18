class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    question = Question.find(@vote.question_id)
    @group = Group.find(question.group_id)
    @already_voter_ids = question.votes.collect { |v| v.user_id }
    if question.votes.length == @group.users.length
      question.finished = true
      question.save  
    end
    if @already_voter_ids.include?(@vote.user_id)
      flash[:notice] = "#{question.votes.length} : #{@group.users.length}"
      if question.finished
        flash[:notice] = "決着はすでについております。"
      end
      redirect_to @group
    elsif question.finished
      flash[:notice] = "すでに投票は終了しています。"
      redirect_to @group 
    elsif @vote.save
      flash[:notice] = "投票しました。"
      redirect_to @group
    else
      flash[:notice] = "投票できませんでした。"
      redirect_to @group
    end
  end

  def update
  end

  def destroy
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :choice_id, :question_id)
  end
end
