class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.text :description

      t.timestamps
    end
  end
end
