module LoginHelper
  extend ActiveSupport::Concern

  module ClassMethods
    def sign_in(who = :user)
      let(:current_user) { FactoryGirl.create(who) }
      before(:each) { sign_in current_user }
    end
  end

  def sign_in(user)
    visit log_in_path  
    #print page.html  
    fill_in "email", with: user.email
    fill_in "password", with: '123456'
    click_button 'Log in'
  end

  def sign_out
    visit sign_out_path
  end
end