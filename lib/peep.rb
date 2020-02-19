require 'pg'

class Peep

  attr_reader :id, :name, :username, :content, :time, :date

  def initialize(id:, name:, username:, content:, time:, date:)
    @id = id
    @name = name
    @username = username
    @content = content
    @time = time
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], username: peep['username'], content: peep['content'], time: peep['time'], date: peep['date'])
    end
  end

  def self.create(name:, username:, content:, time:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (username, name, content, time, date) VALUES('#{name}', '#{username}', '#{content}','#{time}', '#{date}') RETURNING id, name, username, content, time, date;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], content: result[0]['content'], time: result[0]['time'], date: result[0]['date'],)
    # connection.exec("INSERT INTO peeps (username, name, content, time, date) VALUES('#{name}', '#{username}', '#{content}', '#{time}', '#{date}') RETURNING name, username, content, time, date;")
  end
end
