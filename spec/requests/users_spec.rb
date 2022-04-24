require 'rails_helper'

RSpec.describe 'API Users' do
  let(:headers) { { "Content-Type": 'application/json', "Accept": 'application/json' } }
  let(:valid_user) do
    { email: 'user_email@gmail.com',
      password: '12345',
      password_confirmation: '12345' }
  end
  let(:invalid_user) { { email: '', password: '', password_confirmation: '' } }
  let(:bad_password) { { email: 'user_email@gmail.com', password: '1234', password_confirmation: '12345' } }
  describe 'POST api/v1/users' do
    context 'when params are valid' do
      it 'returns a user json and status 201' do
        VCR.use_cassette('phone_calling') do
          post api_v1_users_path, headers: headers, params: JSON.generate(valid_user)

          user = JSON.parse(response.body, symbolize_names: true)
          expect(user).to have_key(:data)
          expect(user[:data]).to have_key(:id)
          expect(user[:data][:attributes]).to have_key(:email)
          expect(user[:data][:attributes]).to have_key(:api_key)

          expect(user[:data][:id]).to be_a(Integer)
          expect(user[:data][:attributes][:email]).to be_a(String)
          expect(user[:data][:attributes][:api_key]).to be_a(String)

          expect(user[:data][:attributes]).to_not have_key(:password)
          expect(user[:data][:attributes]).to_not have_key(:password_confirmation)

          expect(response).to have_http_status(201)
        end
      end
    end
    context 'when user info isnt valid' do
      it 'returns unprocessable entity, status 400, error response' do
        post api_v1_users_path, headers: headers, params: JSON.generate(invalid_user)

        errors = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(errors[:errors]).to match(["Email can't be blank", "Password digest can't be blank",
                                          "Password can't be blank"])
      end
    end
    context 'when user password doesnt match' do
      it 'returns unprocessable entity, status 400, error response' do
        post api_v1_users_path, headers: headers, params: JSON.generate(bad_password)

        errors = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(errors[:errors]).to match(["Password confirmation doesn't match Password"])
      end
    end
  end
end
