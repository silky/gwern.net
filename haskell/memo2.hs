main :: IO ()
main = interact (unlines . tabify . couplet . lines)

couplet :: [String] -> [(String, String)]
couplet [] = []
couplet (_:[]) = []
couplet (a:b:c) = [((erase a), b), (a,b)] ++ [(a, (erase b)), (a,b)] ++ couplet c
                  where erase = map (const '_')

tabify :: [(String, String)] -> [String]
tabify = map (\((x,y), (z,a)) -> x ++ "<br>" ++ y ++ "\t" ++ z ++ "<br>" ++ a) . tuplize
         where tuplize (a:b:c) = (a,b) : tuplize c
               tuplize _ = []