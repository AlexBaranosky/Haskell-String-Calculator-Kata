main = do
   assertEquals 0 $ add ""

add string =  0

assertEquals expressionA expressionB = putStrLn $ if expressionA == expressionB then "yes!" else "you failed!"

assertTrue expression = putStrLn $ if expression then "yes!" else "you failed!"
