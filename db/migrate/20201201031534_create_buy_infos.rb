class CreateBuyInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_infos do |t|

      t.timestamps
    end
  end
end
