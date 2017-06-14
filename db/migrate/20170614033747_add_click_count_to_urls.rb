class AddClickCountToUrls < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :click_count, :int, default: 0
  end
end
