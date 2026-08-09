#import "/Helpers/common.typ": ALPHABET, FAILED_BRAILE, LETTERS_IN_ALPHABET, mod, normalize, rng
#import "/Helpers/maps.typ": fromBraileMap, toBraileMap

// returns braille overlap of two inputed characters
#let maskBraille(a: (int, int, int, int, int, int), b: (int, int, int, int, int, int)) = {
  a.zip(b).map(((x, y)) => if x == 1 or y == 1 { 1 } else { 0 })
}

#let differenceBraille(a: (int, int, int, int, int, int), b: (int, int, int, int, int, int)) = {
  a.zip(b).map(((x, y)) => if y == 1 { 0 } else { x })
}

// generates a combination of two characters that when masked together produce the inputed character
// if no combination is found, it returns the inputed character
#let generateMaskCombination(char: str, seed: int, tries: int) = {
  for i in range(tries) {
    let index = mod(val: rng(i: seed) + i, mod: LETTERS_IN_ALPHABET)
    let firstChar = ALPHABET.at(index)
    let brailleFirst = toBraileMap.at(firstChar, default: FAILED_BRAILE)

    if brailleFirst == FAILED_BRAILE {
      continue
    }

    for i in range(LETTERS_IN_ALPHABET) {
      let secondIndex = mod(val: index + i + 1, mod: LETTERS_IN_ALPHABET)
      let secondChar = ALPHABET.at(secondIndex)

      let brailleSecond = toBraileMap.at(secondChar, default: FAILED_BRAILE)

      if brailleSecond == FAILED_BRAILE or brailleFirst == brailleSecond {
        continue
      }

      // 50% chance of skipping the combination to add some randomness
      let braileIndex
      let isMasked = mod(val: rng(i: seed) + i, mod: 2) == 0
      if isMasked {
        braileIndex = "(" + maskBraille(a: brailleFirst, b: brailleSecond).map(x => (str)(x)).join(", ") + ")"
      } else {
        braileIndex = "(" + differenceBraille(a: brailleFirst, b: brailleSecond).map(x => (str)(x)).join(", ") + ")"
      }

      let generatedChar = fromBraileMap.at(braileIndex, default: "")

      // 1/3 chance of skipping the combination to add some randomness
      if generatedChar == char {
        let operand = if isMasked { " + " } else { " - " }
        return upper(firstChar) + operand + upper(secondChar)
      }
    }
  }

  return upper(char)
}

#let brailleMaskingCypher(word: str, separator: str) = {
  set text(13pt)

  let out = ()
  let seed = 52
  let normalizedWord = lower(normalize(word: word)).split("").map(c => if c in ALPHABET { c } else { "" }).join("")

  // retarded workaround
  for index in range(normalizedWord.len()) {
    let c = normalizedWord.at(index)
    out.push(generateMaskCombination(char: c, seed: seed, tries: LETTERS_IN_ALPHABET))
  }
  out.join(separator)
}
