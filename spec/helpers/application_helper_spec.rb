require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    
    describe "#full_title" do

      page_title = "FAKE"
      base_title = "Disaster Resource Network"

      it "returns: page_title | base_title" do
        expect(full_title(page_title)).to eq("#{page_title} | #{base_title}")
      end

      it "returns: base_title, if page_title is empty" do
        expect(full_title("")).to eq(base_title)
      end
    end
end
