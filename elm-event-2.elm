import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)

-- MODEL


type alias Model =
  Int 

init : ( Model, Cmd Msg )
init =
  ( 0, Cmd.none )




-- MESSAGES


type Msg
  = Increment Int 



-- VIEW


view : Model -> Html Msg
view model =
  div []
  [ button [ onClick (Increment 2) ] [ text "+2" ]
  , text (toString model) 
  ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of 
    Increment quantity ->
      ( model + quantity, Cmd.none )




-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- MAIN


main =
  program 
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

