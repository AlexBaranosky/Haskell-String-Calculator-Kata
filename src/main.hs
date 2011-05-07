import Data.List.Split
import Data.String.Utils

main = do
   assertEquals "blank string adds up to 0" 0 $ add ""
   assertEquals "one adds up to one" 1 $ add "1"
   assertEquals "one number alone adds up to itself" 2 $ add "2"
   assertEquals "adds any number of comma-separated numbers" 20 $ add "2,3,4,5,6"
   assertEquals "can separate numbers by either ',' or '\n'" 9 $ add "2\n3,4"
   assertEquals "can specify your own delimiter" 3 $ add "//;\n1;2"

add = sum . numbersFrom . splitIntoDelimiterWithNumberString

splitIntoDelimiterWithNumberString string
   | string == ""                      = (',', "0")
   | startswith "//" string = (string !! 2, drop 4 string)
   | otherwise                       = (',', string)

numbersFrom (delimiter, numberString) =
   map read $ splitWhen (\c -> c == delimiter || c == '\n') numberString

assertEquals msg expressionA expressionB =
   putStrLn $ (if expressionA == expressionB then "yes: " else "you failed: ") ++ msg
