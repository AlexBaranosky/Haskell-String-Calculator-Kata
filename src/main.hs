import Data.List.Split
import Data.String.Utils

main = do
   assertEquals "blank string adds up to 0" 0 $ add ""
   assertEquals "one adds up to one" 1 $ add "1"
   assertEquals "one number alone adds up to itself" 2 $ add "2"
   assertEquals "adds any number of comma-separated numbers" 20 $ add "2,3,4,5,6"
   assertEquals "can separate numbers by either ',' or '\n'" 9 $ add "2\n3,4"
   assertEquals "can specify your own delimiter" 3 $ add "//;\n1;2"

add string
   | string == "" = 0
   | otherwise = sum $ numbersFrom  (delimiterOf string)  (numbersPartOf string)

numbersFrom delimiter = map read . splitWhen (\c -> c == delimiter || c == '\n')

delimiterOf string = if specifiesDelimiter string then string !! 2 else ','

numbersPartOf string = if  specifiesDelimiter string then drop 4 string else string

specifiesDelimiter = startswith "//"

assertEquals msg expressionA expressionB =
   putStrLn $ (if expressionA == expressionB then "yes: " else "you failed: ") ++ msg
