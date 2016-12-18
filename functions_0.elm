import Html
import String

capitalize maxLength name =
  if String.length name > maxLength then
     String.toUpper name
  else
    name

main =
  let 
      name = 
        "Jerry"

      length = 
        String.length name
  in
     (capitalize 3 name)
        ++ " - name length : "
        ++ (toString length)
        |> Html.text
