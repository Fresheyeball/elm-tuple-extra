module Test.Tuple2 exposing (main, tests)

import Check exposing (..)
import Check.Producer as CP exposing (Producer)
import Check.Test as CT
import ElmTest as T exposing (Test)
import Tuple2


main : Program Never
main =
    T.runSuiteHtml tests


tests : Test
tests =
    suite "Tuple2"
        [ suite "sort"
            [ claim "sort is idempotent"
                `that` (Tuple2.sort >> Tuple2.sort)
                `is` Tuple2.sort
                `for` CP.tuple ( CP.int, CP.int )
            , claim "sort commutes with toList"
                `that` (Tuple2.sort >> Tuple2.toList)
                `is` (Tuple2.toList >> List.sort)
                `for` CP.tuple ( CP.int, CP.int )
            ]
        ]
        |> quickCheck
        |> CT.evidenceToTest
