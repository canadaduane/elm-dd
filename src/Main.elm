module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { value : String
    , placeholder : String
    }


initialModel : Model
initialModel =
    { value = ""
    , placeholder = "placeholder"
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | ToggleDropdown


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleDropdown ->
            ( { model | value = "value present" }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


renderDropdownValueHtml : Model -> Html Msg
renderDropdownValueHtml model =
    let
        isPlaceHolder =
            (String.length model.value) == 0

        dropdownValue =
            if isPlaceHolder then
                Debug.log "Render PlaceHolder" model.placeholder
            else
                Debug.log "Render Value" model.value
    in
        div
            [ class <|
                if isPlaceHolder then
                    "elm-dropdown__value is--placeholder"
                else
                    "elm-dropdown__value"
            , onClick ToggleDropdown
            ]
            [ text dropdownValue
            ]


view : Model -> Html Msg
view model =
    div []
        [ node "style"
            []
            [ text "body { text-align: center; } .elm-dropdown__value { font-size: 3em; }" ]
        , renderDropdownValueHtml model
        ]
