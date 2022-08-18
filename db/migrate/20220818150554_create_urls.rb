class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :http_url
      t.string :short_code

      t.timestamps
    end
  end
end
