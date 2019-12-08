require "rails_helper"

RSpec.describe ShelterReview do
  describe "relationships" do
    it { should belong_to :shelter }
  end
end