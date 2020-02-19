require 'bcrypt'
require 'database_helpers'
require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')

    persisted_data = persisted_data(id: user.id)

    expect(user).to be_a User
    # expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
    it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end

  describe '.authenticate' do
    it 'returns a username given a correct email and password' do
      user = User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')

      expect(User.authenticate(email: 'incorrectemail@gmail.com', password: 'password123')).to be_nil
    end
    # it 'returns nil given an incorrect password' do
    #   user = User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')
    #
    #   expect(User.authenticate(email: 'test@example.com', password: 'incorrectpassword')).to be_nil
    # end
  end
end
