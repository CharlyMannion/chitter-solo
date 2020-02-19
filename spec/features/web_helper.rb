def add_test_data
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (username, name, content) VALUES ('Charly', 'Charlotte Mannion', 'My first peep');")
  connection.exec("INSERT INTO peeps (username, name, content) VALUES ('Charly', 'Charlotte Mannion', 'Peep');")
end

def happy_sign_in
  fill_in(:email, with: 'test@example.com')
  fill_in :password, with: 'password123'
  click_button('Sign in')
end
