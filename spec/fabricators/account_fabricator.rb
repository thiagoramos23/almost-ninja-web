Fabricator(:account) do
	email ::Faker::Internet.safe_email
	password { 'testtesttest' }
  password_confirmation { 'testtesttest' }
end
