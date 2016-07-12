class AddYoutubeToAnime < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :Youtube, :string
  end
end
