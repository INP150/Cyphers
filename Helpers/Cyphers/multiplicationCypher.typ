#import "/Helpers/maps.typ": mathMap
#import "/Helpers/common.typ": simpleTranslation

#let multiplicationCypher(word: str) = {
  simpleTranslation(word: word, separator: " ", table: mathMap)
}
