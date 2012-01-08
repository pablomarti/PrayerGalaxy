class CreateCommunityPosts < ActiveRecord::Migration
  def change
    create_table :community_posts do |t|
      t.string :title
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
