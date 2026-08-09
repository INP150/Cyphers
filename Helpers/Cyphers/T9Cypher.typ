#import "/Helpers/maps.typ": mathMap
#import "/Helpers/common.typ": simpleTranslation


#let T9Cypher(word: str) = {
  set text(13pt)
  simpleTranslation(word: word, separator: " ", table: mathMap)
}
