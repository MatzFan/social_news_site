class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :article, index: true, presence: true
      t.boolean :up

      t.timestamps
    end
    add_foreign_key(:votes, :articles)
  end
end
