

#let parbreak() = [HELLO MY]

#let eg = [_e.g._]
#let etc = [_etc._]
#let ie = [_i.e._]

= Overview
wot2 is a document processing language. it takes a text document and outputs
a text document.

any plaintext document is a valid wot2 program. 

NOT a typesetting system, more of a markup language.

= Usecase
- essays
- blogs

= Semantics
purely functional language. functions take exactly one argument, and
could potentially return other functions (currying/higher order functions).

wot2 has 2 contexts:
- text mode
- code mode

text mode is the default where all text is just considered strings.

paragraph semantics. paragraphs are treated as one logical unit in text mode
when a macro is invoked (e.g. `\foo`).

double newline separates paragraphs.

== Types
- string
- record (similar to lua tables)
- functions

== Syntax
functions are implicitly called by juxtaposition.

the `:` operator creates a record with the left-hand side as the key, and
the right hand side as the value. individual records are concatenated
together implicitly (use parens to disambiguate). uses comma to concat rn

the `,` operator is used to concatenate the lhs and rhs. used for strings,
records.

for records, it's a union operation. duplicate keys result in an error.

quoted strings don't exist only bracketed strings (`[ ... ]`), and
"symbols", #ie `'foo`

=== String Interpolation
in code context inside a string normal backslash syntax applies. this lets
you reference variables or call functions

=== Definitions
```
\let x 'foo

# closure
\let id !x x
```

=== Closures
```
\!x [\x]

\!x (!y [\x \y]) '1 '2

\let greet !pers [
  Hello, \pers.name! You are \pers.age years old.
]

\greet (
  'name: 'Jack,
  'age: '152
)
```

=== Example
```
\h1 Some Article
\p matchlock's ornithology lattes divisible 

\takes_2([foo], [bar]) 

\title_page(
  :[carburettor bigotry's gullible spits memorisation Arkansans],
  
  'title: [Hello John, you WANKER],
  'author: 'Jack,

  'body: title_page('foo: [lol]),

  :[lelelelele],

  

)

\sec[Title][
  asd asd asd asd asd

  sdf sdf sdf sdf sfd
]

\b[\foo bar] BigJizzah
\b By: \p Big Jizzah

\h1  Title
\p   Fooo har
     baz bing bingus bogus
```
