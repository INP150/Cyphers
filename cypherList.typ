#import "/Helpers/importer.typ": (
  T9Cypher, binaryCypher, brailleMaskingCypher, caesarCypher, keyboardCypher, morseCypher, reverseCypher,
)

#set text(11pt)

= Pravý skaut
#morseCypher(word: "Skautský šátek je nejlepší šátek")


= Tennet
#reverseCypher(word: "Zpátky do budoucnosti je banger film")


= Řecký salát
#caesarCypher(word: "Přišel jsem, viděl jsem, zvítězil jsem.", shift: 1)


= Mileniál
#T9Cypher(word: "Kdo se taky citi jako boomer.")

#import "Helpers/Cyphers/brailleMaskingCypher.typ": generateMaskCombination

= Maskování
#brailleMaskingCypher(word: "Maska na pleť je super", seed: 52, separator: "      ")


= Opičí psaní
#keyboardCypher(word: "Psaní všemi deseti je náročné ale stojí to za to")


= Dvojitý pokec
#binaryCypher(word: "Píp píp, já jsem počítač")
