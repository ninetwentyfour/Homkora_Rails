require 'spec_helper'

describe User do
  describe "relations" do
    it{should have_many(:projects)}
  end

  describe "validations" do
    it{should validate_presence_of(:username)}
    it{should validate_presence_of(:email)}
  end
end
