#import "/Helpers/maps.typ": morseMap
#import "/Helpers/common.typ": simpleTranslation

#let morseCypher(word: str) = {
  set text(13pt)
  simpleTranslation(word: word, separator: "/", table: morseMap)
}
