module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- Model


type alias Model =
  Int


initModel : Model
initModel = 
  0 

-- Update

type Msg 
  = Addcalorie
  | Clear

update : Msg -> Model -> Model
update msg model =
  case msg of
    Addcalorie ->
      model + 1

    Clear ->
      initModel
      
-- view 

view : Model -> Html Msg
view model = 
  div [] 
    [ h3 [] 
      [ text ("Total Calories: " ++ (toString model)) ]
     , button 
        [ type_ "button", onClick Addcalorie ]
        [ text "Add Calorie" ]
     , button 
        [ type_ "button", onClick Clear ]
        [ text "Clear" ]
    ]

main : Program Never Model Msg
main =
  Html.beginnerProgram
  { model = initModel
  , update = update
  , view = view
  }
