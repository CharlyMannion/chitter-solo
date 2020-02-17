feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Chitter"
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
  end
end
