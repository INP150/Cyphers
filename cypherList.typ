#import "/Helpers/importer.typ": (
  binaryCypher, braileSubstractionCypher, caesarCypher, keyboardCypher, morseCypher, multiplicationCypher,
  reverseCypher,
)

= Keyboard Cypher

#keyboardCypher(word: "hi my name is John.")

= Caesar Cypher

#caesarCypher(word: "hi my name is John.", shift: 1)


= Math Cypher

#multiplicationCypher(word: "hi my name is John.")

= Morse Cypher

#morseCypher(word: "hi my name is John.")

= Math cypher

#multiplicationCypher(word: "hi my name is John.")

= Braile Cypher

//#braileSubstractionCypher(word: "hi my name is John.")

= Reverse Cypher

#reverseCypher(word: "hi my name is John.")

= Binary Cypher

#binaryCypher(word: "hi my name is John.")
