class DeleteImageUrlToProduit < ActiveRecord::Migration[6.0]
  def change
    remove_column :produits, :image_url, :string
  end
end
