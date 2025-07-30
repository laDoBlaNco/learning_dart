/*
OPERATOR PRECEDENCE EXAMPLES

dart supports the operators shown in the list beloww. The list shows dart's
operator precedence from highest to lowest, which are an APPROXIMATION of
the operator relationships. 

I need to keep in mind that this is only a helpful guide. The notion of
operator precedence is an approximation of the truth found in the language
grammar. I can get the real specifics in the Dart Language Specification

unary postfix --  expr++, expr--, (), [], ?[], ., ?., !
unary prefix  --  -expr, !expr, ~expr, ++expr, --expr, await expr
multiplicative -- *, /, %, ~/
additive      --  +, -
shift         --  <<, >>, >>>
bitwise AND   --  &
bitwise XOR   -- ^
bitwise OR    -- |
relational and -- >=, >, <=, <, as, is, is!
type test
equality      -- ==, !=
logical AND   -- &&
logical OR    -- ||
if-null       -- ?? (null coalesching operator)
conditional   -- expr1 ? expr2 : expr3  (ternary operator)
cascade       -- .., ?.. 🤔🤔🤔
assignment    -- =, *=, /=, +=, -=, &=, ^=, etc. 
spread        -- ..., ...?

*/

//