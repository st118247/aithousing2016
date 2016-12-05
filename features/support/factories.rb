FactoryGirl.define do
  factory :officer_role_admin, class: OfficerRole do
    role 'Admin'
  end

  factory :admin, class: User do
    email 'admin@ait.asia'
    password 'password'
    password_confirmation 'password'
    status 'active'
    association :officer_role, factory: :officer_role_admin
  end

  factory :officer_no_role, class: OfficerRole do
    role 'NoRole'
  end

  factory :staff, class: User do
    email 'staff@ait.asia'
    password 'password'
    password_confirmation 'password'
    status 'active'
    association :officer_role, factory: :officer_no_role
  end
end