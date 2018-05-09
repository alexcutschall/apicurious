require 'spec_helper'

describe Repository do
  let(:attributes) {
    {
      name: "Repository Name",
      html_url: "Repository URL"
    }
  }
  subject{ Repository.new(attributes)}

  context "initialize" do
    it "exists with attributes" do
      expect(subject).to be_a Repository
      expect(subject.name).to eq("Repository Name")
      expect(subject.url).to eq("Repository URL")
    end
  end
end
