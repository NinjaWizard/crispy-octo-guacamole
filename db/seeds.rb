# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
csv = CSV.read("C:\\Users\\Me\\Desktop\\pokemon.csv", headers: true).map do |row|
  row = row.to_h.transform_keys({ "#" => "number",
                            "Name" => "name",
                            "Type 1" => "type_1",
                            "Type 2" => "type_2",
                            "Total" => "total",
                            "HP" => "hp",
                            "Attack" => "attack",
                            "Defense" => "defense",
                            "Sp. Atk" => "sp_atk",
                            "Sp. Def" => "sp_def",
                            "Speed" => "speed",
                            "Generation" => "generation",
                            "Legendary" => "legendary" })
  row["legendary"] = row["legendary"] == "True"
  row
end
Pokemon.create(csv)
