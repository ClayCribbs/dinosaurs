require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  it 'invokes the Registrations controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end

RSpec.describe Users::ConfirmationsController, type: :controller do
  it 'invokes the Confirmations controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end

RSpec.describe Users::UnlocksController, type: :controller do
  it 'invokes the Unlocks controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end

RSpec.describe Users::SessionsController, type: :controller do
  it 'invokes the Sessions controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end

RSpec.describe Users::PasswordsController, type: :controller do
  it 'invokes the Passwords controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  it 'invokes the OmniauthCallback controller' do
    expect(@request.env['devise.mapping'] = Devise.mappings[:user]).not_to be(nil)
  end
end
