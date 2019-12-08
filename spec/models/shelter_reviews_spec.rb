require "rails_helper"

RSpec.describe ShelterReview do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:review) }
    it { should validate_inclusion_of(:rating).in_range(1..5) }
  end

  describe "relationships" do
    it { should belong_to :shelter }
  end
end