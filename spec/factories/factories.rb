# frozen_string_literal: true

# spec/factories.rb

FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '1')}@sample.com" }
    password { '123456' }
  end
end
