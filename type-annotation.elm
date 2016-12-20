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

free : Int -> Int -> Item -> Item
free minQty freeQty item =
  if item.freeQty == 0 && minQty > 0 then 
     { item | freeQty = item.qty // minQty * freeQty }
  else
    item

newCart : List Item
newCart = 
  List.map ((free 10 3) >> (free 5 1)) cart

main = 
  Html.text (toString newCart)
