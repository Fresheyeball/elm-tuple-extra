module Test.Tuple3 exposing (main, tests)

import Check exposing (..)
import Check.Producer as CP exposing (Producer)
import Check.Test as CT
import ElmTest as T exposing (Test)
import Tuple3


-- import Laws exposing (claim, equivalent)


main : Program Never
main =
    T.runSuiteHtml tests


tests : Test
tests =
    suite "Tuple3"
        [ suite "sort"
            [ claim "sort is idempotent"
                `that` (Tuple3.sort >> Tuple3.sort)
                `is` Tuple3.sort
                `for` CP.tuple3 ( CP.int, CP.int, CP.int )
            , claim "sort commutes with toList"
                `that` (Tuple3.sort >> Tuple3.toList)
                `is` (Tuple3.toList >> List.sort)
                `for` CP.tuple3 ( CP.int, CP.int, CP.int )
            ]
        ]
        |> quickCheck
        |> CT.evidenceToTest
