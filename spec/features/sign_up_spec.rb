feature 'Signing up to Chitter' do
  scenario 'A user can see the sign up form' do
    visit('/users/new')
    fill_in('name', with: 'Test Person')
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'TestUsername')
    fill_in('password', with: 'password123')
    click_button('Submit')

    # expect(page).to have_content "Welcome, test@example.com"
    expect(page).to have_content "Welcome"
    expect(page).to have_content("TestUsername")
  end
end
