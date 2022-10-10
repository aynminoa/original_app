FactoryBot.define do
  
  factory :user do
    name { 'test_general' }
    email { 'general@example.com' }
    password { 'testpassword'}
    admin { false }
  end

  factory :second_user, class: User do
    name { 'test_general2' }
    email { 'general2@example.com' }
    password { 'testpassword2'}
    admin { false }
  end

  factory :admin_user, class: User do
    name { 'test_admin' }
    email { 'admin@example.com' }
    password { 'adminpassword'}
    admin { true }
  end

  factory :guest_user, class: User do
    name { 'test_guest' }
    email { 'guest@example.com' }
    password { 'guestpassword'}
    admin { false }
  end

  factory :guest_admin_user, class: User do
    name { 'test_guest_admin' }
    email { 'guest_admin@example.com' }
    password { 'guestadminpassword'}
    admin { true }
  end

end
