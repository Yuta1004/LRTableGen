module ParserGen.Core.Language.Rule
    ( RuleElem(..)
    , Rule(..)
    , class RuleSet
    , kind
    , top
    , rule
    ) where

import Prelude

import Type.Proxy (Proxy)

import Data.Enum (class Enum)
import Data.Hashable (class Hashable)

import ParserGen.Core.Language.Token (class TokenSet)

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
    ( TokenSet ts tdef
    , Show rs
    , Enum rs
    , Bounded rs
    , Hashable rs
    )
    <= RuleSet ts tdef rs rkind
        | rs -> ts
        , rs -> rkind
    where
        kind :: Proxy rs -> rkind
        top :: Proxy rs -> rs
        rule :: rs -> Array(Rule ts rs)
