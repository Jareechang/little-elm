import Html
import List exposing (length)
import String exposing (left, slice, split) 

shift str = 
  (slice 0 1 str)

(~=) str1 str2 =
  String.left 1 str1 == String.left 1 str2

wordCount para =
  split " " para
  |> length

main =
  (wordCount "today is a great day")
  |> toString
  |> Html.text


