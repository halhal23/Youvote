class AddDefaultToQuestionFinished < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :finished, false
  end
end
