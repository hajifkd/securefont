import Control.Monad
import System.Environment (getArgs)
import Data.List (permutations)
import Data.Array
import Common


isValidMns :: [Int] -> Bool
isValidMns mns = checkDigit mnheads == mntail
  where
    (mnheads, [mntail]) = splitAt 11 mns

decode :: [String] -> String -> [[Int]]
decode emns table = [[tablea ! e | e <- emn] | emn <- emns]
  where
    tablea = array ('A', 'J') $ zip table [0..]

main :: IO ()
main = do
  header  <- getLine
  putStrLn header
  times   <- read . head <$> getArgs
  mns     <- replicateM times getLine
  let tables = filter (all isValidMns . decode mns) $ permutations enc
  mapM_ putStrLn tables
