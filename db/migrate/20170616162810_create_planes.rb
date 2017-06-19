class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :flight, null: false
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
