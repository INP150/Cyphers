#import "/Helpers/maps.typ": keyboardMap
#import "/Helpers/common.typ": remove_diacritics, simpleTranslation

#let keyboardCypher(word: str) = {
  set text(12pt)
  let cleanedWord = lower(remove_diacritics(word: word))
  simpleTranslation(word: cleanedWord, separator: " | ", table: keyboardMap)
}
