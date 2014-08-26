class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :length
      t.string :title
      t.string :short_description
      t.string :youtube

      t.timestamps
    end
  end
end
