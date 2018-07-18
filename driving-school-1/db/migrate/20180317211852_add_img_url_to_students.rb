class AddImgUrlToStudents < ActiveRecord::Migration
  def change
    add_column :students, :img_url, :string
  end
end
