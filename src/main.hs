import Data.List.Split

main = do
   assertEquals "blank string adds up to 0" 0 $ add ""
   assertEquals "one adds up to one" 1 $ add "1"
   assertEquals "one number alone adds up to itself" 2 $ add "2"
   assertEquals "adds any number of comma-separated numbers" 20 $ add "2,3,4,5,6"
   assertEquals "can separate numbers by either ',' or '\n'" 9 $ add "2\n3,4"

add string = case string of
   "" -> 0
   otherwise -> sum $ numbersFrom string

numbersFrom = map read . splitWhen (\c -> c == ',' || c == '\n')

assertEquals msg expressionA expressionB =
   putStrLn $ (if expressionA == expressionB then "yes: " else "you failed: ") ++ msg

assertTrue msg expression =
   putStrLn $ (if expression then "yes!" else "you failed!") ++ msg
