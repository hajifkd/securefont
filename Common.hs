module Common where

enc = "ABCDEFGHIJ"

checkDigit :: [Int] -> Int
checkDigit ps = 11 - pq
  where
    pq      = if pqmod <= 1 then 11 else pqmod
    pqmod   = pqsum `mod` 11
    pqsum   = sumpqs ps 11
    sumpqs (p:ps) n = p * (if n <= 6 then n + 1 else n - 5) + sumpqs ps (n - 1)
    sumpqs [] _     = 0
