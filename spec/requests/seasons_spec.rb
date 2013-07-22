require 'spec_helper'

describe "Seasons" do 
	let(:championship) { create :championship, seasons: [season] }    
	let(:season) { create :season }

	describe "listing seasons" do

		it "display seasons" do
			visit championship_path(championship)
			expect(page).to have_content(season.start_date)
		end

	end

end
