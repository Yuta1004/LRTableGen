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

class
    ( Show ts
    , Enum ts
    , Bounded ts
    , Hashable ts
    )
    <= TokenSet ts def
        | ts -> def
    where
        defToken :: ts -> def
        defTrivia :: ts -> def

allTokens :: forall ts def. (TokenSet ts def) => Proxy ts -> Array ts
allTokens _ = enumFromTo bottom top
