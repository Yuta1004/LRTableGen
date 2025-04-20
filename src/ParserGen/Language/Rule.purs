module ParserGen.Language.Rule
  ( Rule(..)
  , RuleElem
  , class RuleSet
  , top
  , rule
  )
  where

import Prelude

import Type.Proxy (Proxy)

import Data.Enum (class Enum)
import Data.Hashable (class Hashable)

import ParserGen.Language.Token (class TokenSet)

data RuleElem ts rs
    = Term ts
    | Nonterm rs
    | Epsilon
    | EOF

derive instance (Eq ts, Eq rs) => Eq (RuleElem ts rs)

instance (Show ts, Show rs) => Show (RuleElem ts rs) where
    show (Term t) = "(Term " <> show t <> ")"
    show (Nonterm r) = "(Nonterm " <> show r <> ")"
    show Epsilon = "ε"
    show EOF = "$"

newtype Rule ts rs = Rule (Array (RuleElem ts rs))

derive instance (Eq ts, Eq rs) => Eq (Rule ts rs)

instance (Show ts, Show rs) => Show (Rule ts rs) where
    show (Rule elems) = "[" <> show elems <> "]"

class
    ( TokenSet ts
    , Show rs
    , Enum rs
    , Bounded rs
    , Hashable rs
    )
    <= RuleSet ts rs | rs -> ts
    where
        top :: Proxy rs -> rs
        rule :: rs -> Array(Rule ts rs)
