module Tuple2 exposing (..)

{-|

# Map
@docs map, mapFst, mapSnd, mapEach, mapBoth

# Swap
@docs swap

# Sorting
@docs sort, sortBy, sortWith

# Transform
@docs toList

-}


{-| -}
mapFst : (a -> x) -> ( a, b ) -> ( x, b )
mapFst f ( a, b ) =
    ( f a, b )


{-| -}
mapSnd : (b -> x) -> ( a, b ) -> ( a, x )
mapSnd f ( c, a ) =
    ( c, f a )


{-| -}
mapEach : (a -> x) -> (b -> x') -> ( a, b ) -> ( x, x' )
mapEach f f' ( a, c ) =
    ( f a, f' c )


{-| -}
mapBoth : (a -> b) -> ( a, a ) -> ( b, b )
mapBoth f ( a, a' ) =
    ( f a, f a' )


{-| -}
map : (b -> x) -> ( a, b ) -> ( a, x )
map =
    mapSnd


{-| -}
swap : ( a, b ) -> ( b, a )
swap ( a, b ) =
    ( b, a )


{-| -}
sort : ( comparable, comparable ) -> ( comparable, comparable )
sort ( a, b ) =
    if a > b then
        ( b, a )
    else
        ( a, b )


{-| -}
sortBy : (a -> comparable) -> ( a, a ) -> ( a, a )
sortBy f ( a, b ) =
    if f a > f b then
        ( b, a )
    else
        ( a, b )


{-| -}
sortWith : (a -> a -> Order) -> ( a, a ) -> ( a, a )
sortWith cmp ( a, b ) =
    case cmp a b of
        GT ->
            ( b, a )

        _ ->
            ( a, b )


{-| -}
toList : ( a, a ) -> List a
toList ( a, b ) =
    [ a, b ]
