FactoryBot.define do
  factory :purchase do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end                     
    post_code   {111-1234}
    delivery_place_id {"1"}
    city              {"横浜市"}
    address           {"青山1-1-1"}
    phone_number      {"99999999999"}
  end
end
