import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement

type alias Model = Int

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

counter : Model -> Html Msg
counter model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

layout : Model -> List (Model -> Html Msg) -> List (Model -> Html Msg) -> List (Model -> Html Msg) -> Html Msg
layout model left center right =
    div [ class "container" ]
        [ div [ class "row" ]
              [ div [ class "col-md-2" ] (List.map (\m -> m model) left)
              , div [ class "col-md-4" ] (List.map (\m -> m model) center)
              , div [ class "col-md-2" ] (List.map (\m -> m model) right)
              ]
        ]

view model = layout model [] [counter] []
