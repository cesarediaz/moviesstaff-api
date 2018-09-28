class CreateJoinTablePeopleMovies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :people, :movies do |t|
      t.index [:person_id, :movie_id]
      t.index [:movie_id, :person_id]
      t.string :role
    end
  end
end
