class CreateStudies < ActiveRecord::Migration[7.1]
  def change
    create_table :studies do |t|
      t.string :institution
      t.string :degree
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
