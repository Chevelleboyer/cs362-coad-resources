FactoryBot.define do
  factory :ticket do

    name { 'Fake' }
    phone { '15415082244' }
    sequence(:id, 1) { |n| n }
   	region
   	resource_category
   	phone { '6178888888' }

   	trait :open do
   		closed {false}
   	end

  end
end