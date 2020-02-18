require_relative './database_connection'

class User
  attr_reader :id, :name, :email, :username

  def initialize(id:, name:, email:, username:)
    @id = id
    @name = name
    @email = email
    @username = username
  end

  def self.create(name:, email:, username:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES('#{name}','#{email}', '#{username}', '#{password}') RETURNING id, name, email, username;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{:id}")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'])
  end
end
