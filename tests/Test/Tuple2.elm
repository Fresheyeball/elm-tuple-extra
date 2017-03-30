module Test.Tuple2 exposing (tests)

import Tuple2
import Fuzz exposing (Fuzzer)
import Test exposing (Test, describe, fuzz, test)
import Expect


tuple2 : Fuzzer ( Int, Int )
tuple2 =
    Fuzz.map2 (,) Fuzz.int Fuzz.int


tests : Test
tests =
    describe "Tuple2"
        [ describe "sort"
            [ fuzz tuple2 "is idempotent" <|
                (\x ->
                    Expect.equal
                        (x |> Tuple2.sort |> Tuple2.sort)
                        (x |> Tuple2.sort)
                )
            , fuzz tuple2 "commutes with toList" <|
                (\x ->
                    Expect.equal
                        (x |> Tuple2.sort |> Tuple2.toList)
                        (x |> Tuple2.toList |> List.sort)
                )
            ]
        , describe "toTuple"
            [ test "can be used to compose a function with multiple arguments" <|
                \() ->
                    let
                        myObj =
                            { foo = 5, bar = 6, baz = 2 }

                        addFooBar =
                            Tuple2.toTuple .foo .bar
                                >> uncurry (+)
                    in
                        Expect.equal (addFooBar myObj) 11
            ]
        ]
