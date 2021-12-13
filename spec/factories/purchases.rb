FactoryBot.define do
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
  end                    
end
