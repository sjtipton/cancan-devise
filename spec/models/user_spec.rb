require 'spec_helper'

describe User do

  before(:each) do
    @attrs = FactoryGirl.attributes_for(:user)
  end

  describe "attributes" do

    before(:each)do
      @user = Factory(:user)
    end

    after(:each)do
      @user.destroy
    end

    it "should be valid given valid attributes" do
      @user.should be_valid
    end

    it "should respond to 'email'" do
      @user.should respond_to('email')
    end

    it "should respond to 'password'" do
      @user.should respond_to('password')
    end

    it "should respond to 'password_confirmation'" do
      @user.should respond_to('password_confirmation')
    end

    it "should respond to 'role'" do
      @user.should respond_to('role')
    end

  end

  describe "attribute accessibility" do

    describe "email" do

      it "should be accessible" do
        user = User.new(:email => @attrs[:email])
        user.email.should == @attrs[:email]
      end

    end

    describe "password" do

      it "should be accessible" do
        user = User.new(:password => @attrs[:password])
        user.password.should == @attrs[:password]
      end

    end

    describe "password_confirmation" do

      it "should be accessible" do
        user = User.new(:password_confirmation => @attrs[:password_confirmation])
        user.password_confirmation.should == @attrs[:password_confirmation]
      end

    end

    describe "role" do

      it "should be accessible" do
        user = User.new(:role => "admin")
        user.role.should == "admin"
      end

    end

  end

  describe "validations" do

    describe "email" do

      it "should not be blank" do
        no_email = User.new(@attrs.merge(:email => ""))
        no_email.should_not be_valid
      end

      it "should be a valid format" do
        invalid_email = User.new(@attrs.merge(:email => "foobar_at_baz.com"))
        invalid_email.should_not be_valid
      end

    end

    describe "password" do

      it "should not be blank" do
        no_password = User.new(@attrs.merge(:password => ""))
        no_password.should_not be_valid
      end

      describe "length" do

        it "should be at least 6 characters" do
          short_password = User.new(@attrs.merge(:password => "a" * 5))
          short_password.should_not be_valid
        end

      end

    end

    describe "password confirmation" do

      it "should not be blank" do
        no_password_confirmation = User.new(@attrs.merge(:password_confirmation => ""))
        no_password_confirmation.should_not be_valid
      end

      it "should match the password" do
        non_matching_password = User.new(@attrs.merge(:password => "foobar", :password_confirmation => "fiibar"))
        non_matching_password.should_not be_valid
      end

    end

  end

end
