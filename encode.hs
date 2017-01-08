import System.Random
import System.Random.Shuffle (shuffleM)
import Control.Monad
import System.Environment (getArgs)
import Data.Array
import Common

correctMyNumber :: [Int] -> [Int]
correctMyNumber ns = ns ++ [checkDigit ns]

shuffleEnc :: IO String
shuffleEnc = shuffleM enc

main :: IO ()
main = do
  times   <- read . head <$> getArgs
  mnss    <- replicateM times $ replicateM 11 $ (getStdRandom $ randomR (0, 9))
  sencl   <- shuffleEnc
  putStrLn $ "Table: " ++ sencl
  let senc = listArray (0, 9) sencl
  mapM_ (putStrLn . map (senc !) . correctMyNumber) mnss
