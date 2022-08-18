class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
