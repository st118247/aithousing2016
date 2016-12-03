FactoryGirl.define do
  factory :officer_role_admin, class: OfficerRole do
    role 'Admin'
  end

  factory :admin, class: User do
    email 'admin@ait.asia'
    password 'password'
    password_confirmation 'password'
    officer_role_id '1'
  end

  factory :officer_no_role, class: OfficerRole do
    role 'NoRole'
  end

  factory :staff, class: User do
    email 'staff@ait.asia'
    password 'password'
    password_confirmation 'password'
    officer_role_id '2'
  end
end