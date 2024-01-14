class AddPasswordResetTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |table|
      table.string :password_reset_token_digest
    end
  end
end
