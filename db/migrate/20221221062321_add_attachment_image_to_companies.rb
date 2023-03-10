class AddAttachmentImageToCompanies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :companies do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :companies, :image
  end
end
