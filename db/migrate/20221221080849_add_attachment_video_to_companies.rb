class AddAttachmentVideoToCompanies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :companies do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :companies, :video
  end
end
