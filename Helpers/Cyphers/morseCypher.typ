#import "/Helpers/maps.typ": morseMap
#import "/Helpers/common.typ": remove_diacritics, simpleTranslation

#let morseCypher(word: str) = {
  set text(13pt)
  let cleanedWord = lower(remove_diacritics(word: word))
  simpleTranslation(word: cleanedWord, separator: "/", table: morseMap)
}
