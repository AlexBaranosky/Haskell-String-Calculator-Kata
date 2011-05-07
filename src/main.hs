main = do
   assertEquals "blank string adds up to 0" 0 $ add ""
   assertEquals "one number alone adds up to itself" 1 $ add "1"
   assertEquals "one number alone adds up to itself" 2 $ add "2"

add string = case string of
   "" -> 0
   otherwise -> read string ::Int

assertEquals msg expressionA expressionB = putStrLn $ if expressionA == expressionB then "yes!" else "you failed: " ++ msg

assertTrue expression = putStrLn $ if expression then "yes!" else "you failed!"
