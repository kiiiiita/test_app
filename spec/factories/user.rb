FactoryBot.define do
  factory :sclass_user, class: User do
    email 'sclass@test.com'
    account 'sclass'
    password 'testtest'
    password_confirmation 'testtest'
    role_id 3
  end

  factory :mclass_user, class: User do
    email 'mclass@test.com'
    account 'mclass'
    password 'testtest'
    password_confirmation 'testtest'
    role_id 4
  end

  factory :lcalss_user, class: User do
    email 'lclass@test.com'
    account 'lclass'
    password 'testtest'
    password_confirmation 'testtest'
    role_id 5
  end
end
