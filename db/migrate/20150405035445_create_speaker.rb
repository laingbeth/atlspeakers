class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speaker do |t|
      t.string :name
      t.string :contact
      t.text :description
      t.string :headline
      t.string :topics

      t.timestamps null: false
    end
  end
end
