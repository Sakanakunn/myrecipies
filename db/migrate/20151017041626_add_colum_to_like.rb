class AddColumToLike < ActiveRecord::Migration
  def change
    add_column :recipes,:like,:integer
  end
end
