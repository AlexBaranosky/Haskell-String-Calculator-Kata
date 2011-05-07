main = do
   assertTrue

assertTrue expression = putStrLn $ if expression then "yes!" else "you failed!"

assertEquals expressionA exptressionB = putStrLn $ if expressionA == expressionB then "yes!" else "you failed!"
