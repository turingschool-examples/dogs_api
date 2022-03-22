require 'rails_helper'

RSpec.describe 'Search' do
  describe 'happy path' do
    it 'allows user to search for dogs' do
      visit '/'

      fill_in :search, with: 'Corgi'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Dog Breed: Cardigan Welsh Corgi")
      expect(page).to have_content("Temperament: Affectionate, Devoted, Alert, Companionable, Intelligent, Active")
    end

    it 'allows user to search for another govt member' do
      visit '/'

      fill_in :search, with: 'Chihuahua'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Dog Breed: Chihuahua")
      expect(page).to have_content("Temperament: Devoted, Lively, Alert, Quick, Courageous")
    end
  end
end
