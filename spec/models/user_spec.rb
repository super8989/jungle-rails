require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
    end

    context 'given first name, last name, email, password, password confirmation' do
      it 'creates successfully' do
        expect(@user).to be_valid
      end
    end

    context 'given no first name' do
      it 'should fail to create a user' do
        @user.first_name = nil

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context 'given no last name' do
      it 'should fail to create a user' do
        @user.last_name = nil

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context 'given no email' do
      it 'should fail to create a user' do
        @user.email = nil

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'given existing email' do
      it 'should fail to create a user' do
        @user2 = User.create(first_name: 'test2', last_name: 'test2', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')

        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end

    context 'given passwords less than 2 characters' do
      it 'should fail to create a user' do
        @user.password = 'a'
        @user.password_confirmation = 'a'

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
      end
    end

    context 'given password confirmation that do not match password' do
      it 'should fail to create a user' do
        @user.password = 'asdf'
        @user.password_confirmation = 'asd'

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
    end

    context 'given an email and password' do
      it 'should login' do
        @user.save

        @session = User.authenticate_with_credentials("test@test.com", "testing")
        expect(@session).to be_truthy
      end
    end

    context 'given an email with trailing white spaces' do
      it 'should login' do
        @user.save

        @session = User.authenticate_with_credentials(" test@test.com ", "testing")
        expect(@session).to be_truthy
      end
    end

    context 'given an email with uppercase' do
      it 'should login' do
        @user.save

        @session = User.authenticate_with_credentials(" Test@Test.COM ", "testing")
        expect(@session).to be_truthy
      end
    end

    context 'given a wrong email' do
    it 'should not login' do
      @user.save

      @session = User.authenticate_with_credentials("wrong@test.com", "testing")
      expect(@session).to be_falsey
    end
  end

    context 'given a wrong password' do
      it 'should not login' do
        @user.save

        @session = User.authenticate_with_credentials("test@test.com", "wrong")
        expect(@session).to be_falsey
      end
    end  
  end
end
