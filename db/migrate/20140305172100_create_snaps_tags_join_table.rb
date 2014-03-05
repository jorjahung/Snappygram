class CreateSnapsTagsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :snaps, :tags do |t|
      # t.index [:snap_id, :tag_id]
      # t.index [:tag_id, :snap_id]
    end
  end
end
