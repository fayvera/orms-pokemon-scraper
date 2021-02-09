require 'pry'
class Pokemon   
    attr_accessor :id, :name, :type, :db

 def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
 end
 def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

 def self.find(id_num, db)
    pkmn = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pkmn[0], name: pkmn[1], type: pkmn[2], db: db)
 end


end