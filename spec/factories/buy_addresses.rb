FactoryBot.define do
  factory :buy_address do
    token {"tok_abcdefghijk00000000000000000"}
    post { "111-1111" }
    prefecture_id { 2 }
    city { "あああ" }
    block_num { "111" }
    building { "111" }
    phone_num { "11111111111" }


    
  end
end
