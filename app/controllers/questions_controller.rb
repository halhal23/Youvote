class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @group = Group.find(@question.group.id)
    if @question.save
      flash[:notice] = "質問を追加しました。"
      redirect_to @group
    else
      flash[:notice] = "質問を追加できませんでした。"
      redirect_to @group
    end
  end

  def update
  end

  def destroy
  end

  private
  def question_params
    attrs = [
      :title,
      :detail,
      :deadline,
      :group_id,
      choices_attributes: [:name]
    ]
    params.require(:question).permit(attrs)
  end
end
