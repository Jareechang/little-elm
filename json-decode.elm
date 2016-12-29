import Html exposing (Html, text, ul, li, p, div)
import String exposing (..)

import String exposing (..)
import List exposing (..)

import Result exposing (map)

import Json.Decode as Json exposing (..)

type alias Team =
  { department : String
  , names: List String
  }

-- Data 


serverResponse = 
  """
  [{"department":"product","names":["bob","sally","george"]},
  {"department":"marketing","names":["billy","diane","anita"]},
  {"department":"sales","names":["howard","steve","isha"]}]
  """

-- Decoders 


stringDecoder : Json.Decoder (List String)
stringDecoder = 
  Json.list Json.string

infoDecoder : Json.Decoder Team
infoDecoder =
    Json.map2 Team
      (Json.field "department" Json.string)
      (Json.field "names" stringDecoder)

teamDecoder : Json.Decoder (List Team)
teamDecoder = 
  Json.list infoDecoder


-- Html format

toLi name =
  li [] [ text name ]

renderTemplate team = 
  div [] [
    p [] [ text team.department ]
   , ul [] [
      li [] (List.map toLi team.names)
    ]
  ]

transformList : String -> List Char
transformList teams = 
      toList teams


-- Main


main = 
  case Json.decodeString teamDecoder serverResponse of
    Ok teams ->
      div [] [
        p [] [ text "departments" ]
      , ul [] (List.map renderTemplate teams)
      ]

    Err msg ->
      text ("Error: " ++ msg)

