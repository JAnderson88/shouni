class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :genre1
      t.string :genre2
      t.string :genre3
      t.string :genre4
      t.string :genre5
      t.string :e_title
      t.string :j_title
      t.string :token

      t.timestamps
    end
  end
end
