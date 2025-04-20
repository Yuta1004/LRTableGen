module ParserGen.Core.Language.Token
  ( class TokenSet
  , defToken
  , defTrivia
  , allTokens
  )
  where

import Prelude

import Type.Proxy (Proxy)

import Data.Enum (class Enum, enumFromTo)
import Data.Hashable (class Hashable)
import Data.String.Regex (Regex)

class
    ( Show ts
    , Enum ts
    , Bounded ts
    , Hashable ts
    )
    <= TokenSet ts
    where
        defToken :: ts -> Regex
        defTrivia :: ts -> Regex

allTokens :: forall ts. TokenSet ts => Proxy ts -> Array ts
allTokens _ = enumFromTo bottom top
