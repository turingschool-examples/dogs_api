require 'rails_helper'

RSpec.describe 'Search' do
  describe 'happy path' do
    it 'allows user to search for dogs' do
      # json_response = File.read('spec/fixtures/dog_search_results.json')
      # stub_request(:get, "https://api.thedogapi.com/v1/breeds/search?q=Corgi").with(
      #   headers: {
      #  	  'User-Agent'=>'Faraday v2.2.0',
      #  	  'X-Api-Key'=> ENV['api_key']
      #   }).to_return(status: 200, body: json_response, headers: {})
      VCR.use_cassette('dog_breed_search_results', re_record_interval: 7.days) do
        visit '/'

        fill_in :search, with: 'Corgi'
        click_button 'Search'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Dog Breed: Cardigan Welsh Corgi")
        expect(page).to have_content("Temperament: Affectionate, Devoted, Alert, Companionable, Intelligent, Active")
      end
    end

    it 'allows user to search for another govt member', :vcr do
      visit '/'

      fill_in :search, with: 'Chihuahua'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Dog Breed: Chihuahua")
      expect(page).to have_content("Temperament: Devoted, Lively, Alert, Quick, Courageous")
    end
  end
end
