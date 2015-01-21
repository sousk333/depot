require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validate" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image_url) }
    it {
      is_expected.to validate_numericality_of(:price)
        .is_greater_than_or_equal_to(0.01)
    }
    it "validate image_url" do
      ok = %w{
        fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
        http://a.b.c/x/y/z/fred.gif
      }
      ng = %w{ fred.doc fred.gif/more fred.gif.more }

      ok.each do |image_url|
        expect(build(:product, image_url: image_url).valid?).to be_truthy
      end

      ng.each do |image_url|
        expect(build(:product, image_url: image_url).valid?).to be_falsey
      end
    end
  end
end
