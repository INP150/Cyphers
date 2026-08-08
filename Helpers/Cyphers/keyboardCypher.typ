#import "/Helpers/maps.typ": keyboardMap
#import "/Helpers/common.typ": simpleTranslation

#let keyboardCypher(word: str) = {
  simpleTranslation(word: word, separator: " | ", table: keyboardMap)
}
