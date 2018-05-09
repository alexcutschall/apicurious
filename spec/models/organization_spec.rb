require 'spec_helper'
require './app/models/organization'

describe Organization do
  let(:attributes) {
    {
      login: "TestOrganizationName",
      url: "Organization URL",
      avatar_url: "Avatar URL"
    }
  }
  subject{ Organization.new(attributes) }
  context 'initialize' do
    it 'exists with attributes' do
      expect(subject).to be_a Organization
      expect(subject.login).to eq("TestOrganizationName")
      expect(subject.url).to eq("Organization URL")
      expect(subject.avatar_url).to eq("Avatar URL")
    end
  end
end
