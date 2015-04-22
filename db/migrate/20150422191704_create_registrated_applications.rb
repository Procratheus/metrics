class CreateRegistratedApplications < ActiveRecord::Migration
  def change
    create_table :registrated_applications do |t|
      t.references :user, index: true
      t.string :name
      t.string :url

      t.timestamps null: false
    end
    add_foreign_key :registrated_applications, :users
  end
end
