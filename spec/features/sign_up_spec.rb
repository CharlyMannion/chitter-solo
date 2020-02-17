feature 'Signing up to Chitter' do
  scenario 'A user can see the sign up form' do
    visit('/users/new')

    expect(page).to have_content "Sign up to Chitter"
  end
end
