FactoryBot.define do
  factory :purchase_address do
      token {"tok_abcdefghijk00000000000000000"} 
      post_code   {"111-1234"}
      delivery_place_id {"2"}
      city              {"横浜市"}
      address           {"青山1-1-1"}
      building          {"aaaaaaa"}
      phone_number      {"99999999999"}
  end
end
