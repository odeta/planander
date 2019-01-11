class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :color
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
