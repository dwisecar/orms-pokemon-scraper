class Pokemon
    attr_reader :id, :db
    attr_accessor :name, :type

    def initialize(id: nil, name:, type:, db: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        results = db.execute( "SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: results[0], name: results[1], type: results[2], db: db)
    end

end
