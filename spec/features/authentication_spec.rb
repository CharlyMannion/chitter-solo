feature 'Authentication' do
  scenario 'a user can sign in' do
      User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')

      visit '/sessions/new'
      # fill_in :name, with: 'Test Person'
      fill_in :email, with: 'test@example.com'
      # fill_in :username, with: 'TestUsername'
      fill_in :password, with: 'password123'
      click_button('Sign in')

      expect(page).to have_content('Welcome, TestUsername')
    end
end
