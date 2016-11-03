module Tuple4 exposing (..)

{-|
# Getters
@docs fst, snd, trd, fth, tail, init

# Maps
@docs map, mapFst, mapSnd, mapTrd, mapEach, mapAll

# Swap
@docs swirlr, swirll

# Sorting
@docs sort, sortBy, sortWith

# Transform
@docs toList
-}


{-| -}
fst : ( a, b, c, d ) -> a
fst ( a, _, _, _ ) =
    a


{-| -}
snd : ( a, b, c, d ) -> b
snd ( _, b, _, _ ) =
    b


{-| -}
trd : ( a, b, c, d ) -> c
trd ( _, _, c, _ ) =
    c


{-| -}
frt : ( a, b, c, d ) -> d
frt ( _, _, _, d) =
    d


{-| -}
tail : ( a, b, c, d ) -> ( b, c, d )
tail ( _, b, c, d ) =
    ( b, c, d )


{-| -}
init : ( a, b, c, d ) -> ( a, b, c )
init ( a, b, c, _ ) =
    ( a, b, c )


{-| -}
mapFst : (a -> x) -> ( a, b, c, d) -> ( x, b, c, d )
mapFst f ( a, b, c, d ) =
    ( f a, b, c, d )


{-| -}
mapSnd : (b -> x) -> ( a, b, c, d ) -> ( a, x, c, d )
mapSnd f ( a, b, c, d ) =
    ( a, f b, c, d )


{-| -}
mapTrd : (c -> x) -> ( a, b, c, d ) -> ( a, b, x, d )
mapTrd f ( a, b, c, d ) =
    ( a, b, f c, d )


{-| -}
mapFrt : (d -> x) -> ( a, b, c, d ) -> ( a, b, c, x )
mapFrt f ( a, b, c, d ) =
    ( a, b, c, f d )


{-| -}
mapEach : (a -> x) -> (b -> x') -> (c -> x'') -> (d -> x''') -> ( a, b, c, d ) -> ( x, x', x'', x''' )
mapEach f f' f'' ff ( a, b, c, d ) =
    ( f a, f' b, f'' c, ff d )


{-| -}
mapAll : (a -> b) -> ( a, a, a, a ) -> ( b, b, b, b )
mapAll f ( a, a', a'', aa ) =
    ( f a, f a', f a'', f aa )


{-| -}
map : (d -> x) -> ( a, b, c, d ) -> ( a, b, c, x )
map =
    mapFrt


{-| -}
sort : ( comparable, comparable, comparable, comparable ) -> ( comparable, comparable, comparable, comparable )
sort =
    sortWith compare


{-| -}
sortBy : (a -> comparable) -> ( a, a, a, a ) -> ( a, a, a, a )
sortBy conv =
    sortWith (\x y -> compare (conv x) (conv y))


{-| -}
sortWith : (a -> a -> Order) -> ( a, a, a, a ) -> ( a, a, a, a )
sortWith cmp ( a, b, c, d ) =
    let
        goesBefore x y =
            not <| cmp x y == GT
    in
        if a `goesBefore` b then
            if b `goesBefore` c then
                ( a, b, c )
            else if a `goesBefore` c then
                ( a, c, b )
            else
                ( c, a, b )
        else if a `goesBefore` c then
            ( b, a, c )
        else if b `goesBefore` c then
            ( b, c, a )
        else
            ( c, b, a )


{-| -}
swirlr : ( a, b, c ) -> ( b, c, a )
swirlr ( a, b, c ) =
    ( b, c, a )


{-| -}
swirll : ( a, b, c ) -> ( c, a, b )
swirll ( a, b, c ) =
    ( c, a, b )


{-| -}
toList : ( a, a, a, a ) -> List a
toList ( a, b, c, d ) =
    [ a, b, c, d ]
