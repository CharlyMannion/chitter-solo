feature 'Authentication' do
  before do
    User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')

    visit '/sessions/new'
  end

  scenario 'a user can sign in' do
      happy_sign_in

      expect(page).to have_content('Welcome, TestUsername')
    end

    scenario 'a user sees an error if they enter an incorrect email address' do
      fill_in(:email, with: 'wrongemail@gmail.com')
      fill_in :password, with: 'password123'
      click_button('Sign in')

      expect(page).not_to have_content('Welcome, TestUsername')
      expect(page).to have_content('Incorrect email or password, please try again')
    end

    # scenario 'a user sees an error if they enter an incorrect password' do
    #   fill_in(:email, with: 'test@example.com')
    #   fill_in :password, with: 'wrongpassword'
    #   click_button('Sign in')
    #
    #   expect(page).not_to have_content('Welcome, TestUsername')
    #   expect(page).to have_content('Incorrect email or password, please try again')
    # end

    # scenario 'a user can sign out' do
    #   # fill_in(:email, with: 'test@example.com')
    #   # fill_in :password, with: 'password123'
    #   # click_button('Sign in')
    #   happy_sign_in
    #
    #   click_button('Sign out')
    #
    #   expect(page).not_to have_content 'Welcome, test@example.com'
    #   expect(page).to have_content 'You have signed out.'
    # end
    #
    scenario 'a user can sign out' do
      happy_sign_in

      click_button('Sign out')

      expect(page).not_to have_content 'Welcome, test@example.com'
      expect(page).to have_content 'You have signed out.'
    end
end
