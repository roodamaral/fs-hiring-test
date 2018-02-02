require 'rails_helper'
feature "motel features" do 
  before do 
    @user = create(:user)
    @user2 = create(:user, email: "user@user.com")
    @motel = create(:motel, user:@user, name:"Motel1")
    @motel2 = create(:motel, user: @user2, name: "Different Motel")
    log_in
  end
  
  feature "Users personal motel page" do
    before do 
      visit "/users/#{@user.id}"
    end
    scenario "shouldn't see other user's motels" do 
      expect(page).to_not have_text(@motel2.name)
      expect(page).to have_text(@motel.name)
    end  
  end
end
