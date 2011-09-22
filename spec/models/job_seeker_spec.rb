require 'spec_helper'

describe JobSeeker do

  before(:each) do
    @attrs = FactoryGirl.attributes_for(:job_seeker)
  end

  describe "attributes" do

    before(:each)do
      @job_seeker = Factory(:job_seeker)
    end

    after(:each)do
      @job_seeker.destroy
    end

    it "should be valid given valid attributes" do
      @job_seeker.should be_valid
    end

    it "should respond to 'email'" do
      @job_seeker.should respond_to('email')
    end

    it "should respond to 'password'" do
      @job_seeker.should respond_to('password')
    end

    it "should respond to 'password_confirmation'" do
      @job_seeker.should respond_to('password_confirmation')
    end

  end

  describe "validations" do

    describe "email" do

      it "should not be blank" do
        no_email = JobSeeker.new(@attrs.merge(:email => ""))
        no_email.should_not be_valid
      end

      it "should be a valid format" do
        invalid_email = JobSeeker.new(@attrs.merge(:email => "foobar_at_baz.com"))
        invalid_email.should_not be_valid
      end

    end

    describe "password" do

      it "should not be blank" do
        no_password = JobSeeker.new(@attrs.merge(:password => ""))
        no_password.should_not be_valid
      end

      describe "length" do

        it "should be at least 6 characters" do
          short_password = JobSeeker.new(@attrs.merge(:password => "a" * 5))
          short_password.should_not be_valid
        end

      end

    end

    describe "password confirmation" do

      it "should not be blank" do
        no_password_confirmation = JobSeeker.new(@attrs.merge(:password_confirmation => ""))
        no_password_confirmation.should_not be_valid
      end

      it "should match the password" do
        non_matching_password = JobSeeker.new(@attrs.merge(:password => "foobar", :password_confirmation => "fiibar"))
        non_matching_password.should_not be_valid
      end

    end

  end

end
