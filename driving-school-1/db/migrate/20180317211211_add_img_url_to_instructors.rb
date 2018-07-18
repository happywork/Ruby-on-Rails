class AddImgUrlToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :img_url, :string
  end
end
