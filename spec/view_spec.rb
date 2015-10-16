require_relative "spec_helper"
require "./view"
require "rspec"

RSpec.describe View do

  before(:each) do
    @view = View.new
  end

    describe "#banner" do
      it "should be an instance of View" do
        expect(@view).to be_instance_of(View)
      end

      it "should not be empty" do
        bann = @view.banner
        expect(bann.should) != nil
      end

      it "should not equal wrong string" do
        bann = @view.banner
        expect(bann).not_to eq("**********")
      end
    end

    describe "#"

end
