module Test exposing (tests)

import ElmTest as T exposing (Test)
import Test.Tuple2 as Tuple2
import Test.Tuple3 as Tuple3


main : Program Never
main =
    T.runSuiteHtml tests


tests : Test
tests =
    T.suite "elm-tuple-extra"
        [ Tuple2.tests
        , Tuple3.tests
        ]
