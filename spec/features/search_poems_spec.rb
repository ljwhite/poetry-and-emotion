require 'rails_helper'

describe 'When I search for Emily in the search bar' do
  before :each do
    visit '/'
    fill_in :author, with: "Emily"
    click_on "Get Poems"
  end
  it 'I should see a list of ten poems' do
    expected_count = 10
    expect(page).to eq("/index")
  end

  it 'I should also see the tone for each poem' do

  end
end
