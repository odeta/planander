class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :calendar, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :notes
      t.string :place

      t.timestamps
    end
  end
end
