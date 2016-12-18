import Html
import String
import List

type alias Item =
  { name : String 
  , qty : Int
  , freeQty : Int
  }

cart : List Item
cart =
  [ { name = "Lemon", qty = 1, freeQty = 0 }
  , { name = "Apple", qty = 5, freeQty = 0 }
  , { name = "Pear", qty = 10, freeQty = 0 }
  ]


discount : Item -> Item
discount item = 
  if item.qty >= 5 then
    { item | freeQty = 1 }
  else if item.qty >= 10 then
    { item | freeQty = 3 }
  else
    item 

newCart : List Item
newCart = 
  List.map discount cart

main = 
  Html.text (toString newCart)
