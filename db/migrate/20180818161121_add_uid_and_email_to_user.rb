class AddUidAndEmailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :email_address
    add_column :users, :uid, :string
  end
end
