module Theme.Inventory exposing (..)

import Html exposing (..)
import Html.Keyed
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import World exposing (..)
import Story


view :
    Story.World MyItem MyLocation MyCharacter
    -> List MyItem
    -> Html (Story.Msg MyItem MyLocation MyCharacter)
view world items =
    let
        numItems =
            List.length items

        inventoryItem i item =
            let
                key =
                    (toString item) ++ (toString <| numItems - i)
            in
                ( key
                , li
                    [ class "Inventory__Item u-selectable"
                    , onClick <| Story.itemMsg item
                    ]
                    [ text <| .name <| world.items item ]
                )
    in
        div [ class "Inventory" ]
            [ h3 [] [ text "Inventory" ]
            , div [ class "Inventory__list" ]
                [ Html.Keyed.ol []
                    (List.indexedMap inventoryItem items)
                ]
            ]