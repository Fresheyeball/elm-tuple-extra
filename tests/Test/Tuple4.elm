module Test.Tuple4 exposing (main, tests)

import Check exposing (..)
import Check.Producer as CP exposing (Producer)
import Check.Test as CT
import ElmTest as T exposing (Test)
import Tuple4


-- import Laws exposing (claim, equivalent)


main : Program Never
main =
    T.runSuiteHtml tests


tests : Test
tests =
    suite "Tuple3"
        [ suite "sort"
            [ claim "sort is idempotent"
                `that` (Tuple4.sort >> Tuple3.sort)
                `is` Tuple4.sort
                `for` CP.tuple4 ( CP.int, CP.int, CP.int, CP.int )
            , claim "sort commutes with toList"
                `that` (Tuple4.sort >> Tuple4.toList)
                `is` (Tuple4.toList >> List.sort)
                `for` CP.tuple4 ( CP.int, CP.int, CP.int, CP.int )
            ]
        ]
        |> quickCheck
        |> CT.evidenceToTest
