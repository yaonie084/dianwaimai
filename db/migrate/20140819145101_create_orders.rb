class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string    :source_url,  null: false
      t.string    :error_msg,   default: ''
      t.integer   :is_success,  default: 0
      t.datetime  :finish_time, null: false
      t.text      :content


      t.timestamps
    end
  end
end
