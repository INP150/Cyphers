#import "/Helpers/maps.typ": morseMap
#import "/Helpers/common.typ": simpleTranslation

#let morseCypher(word: str) = {
  simpleTranslation(word: word, separator: "/", table: morseMap)
}
