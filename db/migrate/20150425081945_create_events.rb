class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :registrated_application, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :events, :registrated_applications
  end
end
