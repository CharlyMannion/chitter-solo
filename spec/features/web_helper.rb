def add_test_data
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (username, name, content, time, date) VALUES ('Charly', 'Charlotte Mannion', 'My first peep', '12:31:00', '2020-02-18');")
  connection.exec("INSERT INTO peeps (username, name, content, time, date) VALUES ('Charly', 'Charlotte Mannion', 'Peep', '12:32:00', '2020-02-18');")
end

def happy_sign_in
  fill_in(:email, with: 'test@example.com')
  fill_in :password, with: 'password123'
  click_button('Sign in')
end
