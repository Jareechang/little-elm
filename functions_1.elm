import Html
import String exposing (..)

shift str = 
  (slice 0 1 str)

(~=) str1 str2 =
  let 
      firstChar =
        shift str1

      secondChar =
        shift str2
  in
     firstChar == secondChar

result =
  "wow" ~= "wellow"

main =
  (toString result)
  |> Html.text


