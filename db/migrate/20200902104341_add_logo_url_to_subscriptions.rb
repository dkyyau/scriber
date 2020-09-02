class AddLogoUrlToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :logo_url, :string
  end
end
