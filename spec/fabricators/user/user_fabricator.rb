Fabricator(:user) do
  username { Faker::Name.name }
  email { |attrs| "#{attrs[:username].parameterize}@example.com" }
  password               "password"
  password_confirmation  "password"
  confirmed_at "2011-10-05 10:34:01"
  roles_mask 0
end