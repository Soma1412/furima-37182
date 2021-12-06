FactoryBot.define do
  factory :item do
    association :user                      
    item_name                {"りんご"}
    explain                  {"美味しい"}
    category_id              {"5"}
    condition_id             {"1"}
    delivery_cost_id         {"1"}
    delivery_place_id        {"1"}
    delivery_day_id          {"1"}
    price                    {"1500"}
  end
end
