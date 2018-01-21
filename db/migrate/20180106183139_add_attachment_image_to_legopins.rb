class AddAttachmentImageToLegopins < ActiveRecord::Migration[5.0]
  def self.up
    change_table :legopins do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :legopins, :image
  end
end
