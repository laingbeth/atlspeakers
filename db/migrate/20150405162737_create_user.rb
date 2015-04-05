class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :email
      t.string :password_digests

      t.timestamps null: false
    end
  end
end
