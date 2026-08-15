#import "/Helpers/maps.typ": mathMap
#import "/Helpers/common.typ": remove_diacritics, simpleTranslation


#let T9Cypher(word: str) = {
  set text(13pt)
  let cleanedWord = lower(remove_diacritics(word: word))
  simpleTranslation(word: cleanedWord, separator: " ", table: mathMap)
}
