FactoryBot.define do
  factory :ticket do

    name { 'Fake' }
    phone { '15415082244' }
    sequence(:id, 1) { |n| n }
   	region
   	resource_category

   	trait :open do
   		closed { false }
   	end

   	trait :closed do
   		closed { true }
   	end

   	trait :organization do
   		organization
   	end

  end

end