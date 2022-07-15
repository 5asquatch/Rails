FactoryBot.define :post do 
    factory :post do 
        association :user
        title {FFaker::Lorem.sentence}
        body {FFaker::Lorem.paragraph}
    end
end