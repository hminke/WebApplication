class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :semester
      t.string :number
      t.string :roomNumber
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
