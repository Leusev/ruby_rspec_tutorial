# frozen_string_literal: true

# spec/factories.rb

FactoryBot.define do
  # User(
  # id: integer,
  # email: string,
  # encrypted_password: string,
  # reset_password_token: string,
  # reset_password_sent_at: datetime,
  # remember_created_at: datetime,
  # created_at: datetime,
  # updated_at: datetime)
  factory :user, class: User do
    # id { 1 }
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '1')}@sample.com" }
    password { '123456' }
  end
end
