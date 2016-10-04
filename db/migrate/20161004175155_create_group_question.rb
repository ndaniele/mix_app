class CreateGroupQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table :group_questions do |t|
      t.integer :group_id
      t.integer :question_id
    end
  end
end
