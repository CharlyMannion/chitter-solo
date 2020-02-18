require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    add_test_data
    
    visit('/peeps')

    expect(page).to have_content "Chitter"
    expect(page).to have_content "My first peep"
    expect(page).to have_content "Peep"
  end
end
