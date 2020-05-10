Fabricator(:user, class_name: 'Identity::User') do
	email ::Faker::Internet.safe_email
end
