module MonadFin where

getData url = Just "Some data"

-- Doesn't the 'do' notation look familiar, fellow Javascript mates?
getInfo :: Maybe String
getInfo = do -- this do thing looks like something I've used.
  get <- getData "http://localhost:9000/api" -- '<-' operator reminds me of something too!
  return (get ++ "Okay!")


-- Well, maybe (no pun intended) we should write something similar in JS

