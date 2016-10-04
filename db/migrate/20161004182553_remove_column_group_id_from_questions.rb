class RemoveColumnGroupIdFromQuestions < ActiveRecord::Migration[5.0]
   def change
    remove_column :questions, :group_id
  end
end
