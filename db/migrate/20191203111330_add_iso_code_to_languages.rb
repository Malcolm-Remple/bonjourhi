class AddIsoCodeToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :iso_code, :string, default: ""
  end
end
