#import "/Helpers/maps.typ": keyboardMap
#import "/Helpers/common.typ": simpleTranslation

#let keyboardCypher(word: str) = {
  set text(12pt)
  simpleTranslation(word: word, separator: " | ", table: keyboardMap)
}
