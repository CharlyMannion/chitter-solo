feature 'Peep after sign in' do
  before do
    User.create(name: 'Test Person', email: 'test@example.com', username: 'TestUsername', password: 'password123')

    visit '/sessions/new'
  end

  scenario 'a user can peep after signing in' do
    happy_sign_in

    visit('/peeps/new')

    fill_in('content', with: 'I am signed in and peeping')
    click_button('Peep')

    expect(page).to have_content('I am signed in and peeping')
    expect(page).to have_content('Test Person')
  end
end
