# require_relative '../spec_helper'
# 
# require "cancan/matchers"
# 
# describe Canard::Abilities, "for guests" do
# 
#   before do
#   @user = User.create(:roles => %w(guest))
#   end
#   
#   subject { Ability.new(@user) }
#   
#     
#   describe 'on User' do
# 
#     before do
#       @user = Fabricate(:user)
#     end
#     
#     it { should be_able_to( :create,    @user ) }
# 
#   end
#   # on User
#     
#   
# end
#   
