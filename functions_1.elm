import Html
import String exposing (..)

shift str = 
  (slice 0 1 str)

(~=) str1 str2 =
  String.left 1 str1 == String.left 1 str2

main =
  (~=) "hello" "hi"
  |> toString
  |> Html.text


