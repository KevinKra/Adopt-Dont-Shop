require "rails_helper"

RSpec.describe Shelter do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :shelterReviews }
  end
end