class MakeRoleFieldNotNullable < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :role, false
    change_column_default :users, :role, User.roles[:user]
  end
end
