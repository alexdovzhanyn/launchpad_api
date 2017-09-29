class MakeCommentFieldsNotNullable < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :content, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :listing_id, false
  end
end
