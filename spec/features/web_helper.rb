def add_test_data
  connection = PG.connect(dbname: 'chitter_test')
  peep = Peep.create(username: 'Charly', name: 'Charlotte Mannion', content: 'My first peep', time: '12:31:00', date: '2020-02-18')
  peep = Peep.create(username: 'Charly', name: 'Charlotte Mannion', content: 'Peep', time: '12:32:00', date: '2020-02-18')
end

def happy_sign_in
  fill_in(:email, with: 'test@example.com')
  fill_in :password, with: 'password123'
  click_button('Sign in')
end
