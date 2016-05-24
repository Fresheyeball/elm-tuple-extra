module Tuple2 exposing (..)

{-|

# Map
@docs map, mapFst, mapSnd, mapEach, mapBoth

# Swap
@docs swap

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
toList : ( a, a ) -> List a
toList ( a, b ) =
    [ a, b ]
