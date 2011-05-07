import Data.List.Split

main = do
   assertEquals "blank string adds up to 0" 0 $ add ""
   assertEquals "one adds up to one" 1 $ add "1"
   assertEquals "one number alone adds up to itself" 2 $ add "2"
   assertEquals "adds two comma-separated numbers" 5 $ add "2,3"

add string = case string of
   "" -> 0
   otherwise -> sum $ numbersFrom string

numbersFrom :: String -> [Int]
numbersFrom = map read . splitOn ","

assertEquals msg expressionA expressionB = putStrLn $ if expressionA == expressionB then "yes!" else "you failed: " ++ msg

assertTrue expression = putStrLn $ if expression then "yes!" else "you failed!"
