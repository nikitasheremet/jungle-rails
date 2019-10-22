require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should have password, and password confirmation fields otherwise user not created" do
      @user_no_confirm = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a", password: "123")
      @user_no_pass = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a", password_confirmation: "123")
      @user = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a")

      expect(@user_no_confirm.valid?).to eql(false)
      expect(@user_no_pass.valid?).to eql(false)
      expect(@user.valid?).to eql(false)
    end
    it "password and password confirmation should match" do
      @user = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a", password: "123", password_confirmation: "1234")
      expect(@user.valid?).to eql(false)
    end
    it "should not add user if email already exists (not case sensitive)" do
      @user_1 = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a", password: "123", password_confirmation: "123")
      @user_2 = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "a@a", password: "123", password_confirmation: "123")
      @user_3 = User.create(name: "Nikita S", first_name: "Nikita", last_name: "S", email: "A@A", password: "123", password_confirmation: "123")

      expect(@user_2.valid?).to eql(false)
      expect(@user_3.valid?).to eql(false)
    end
    it "should have email, first name, and last name" do
    end
  end
end
