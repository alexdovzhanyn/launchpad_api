class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Tokens
      t.json :tokens
    end

    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end
