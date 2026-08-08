#let braileAdd(firstPattern, secondPattern) = {
  let out = ()

  for i in range(0, 6) {
    out.push(if firstPattern[i] + secondPattern[i] > 0 { 1 } else { 0 })
  }

  out
}

#let braileSubstract(firstPattern, secondPattern) = {
  let out = ()

  for i in range(0, 6) {
    out.push(if firstPattern[i] - secondPattern[i] > 0 { 1 } else { 0 })
  }

  out
}

#let braileCombinationFor(targetPattern) = {
  for (letter, pattern) in braileMap {
    if pattern == targetPattern {
      return letter
    }
  }

  for (firstLetter, firstPattern) in braileMap {
    for (secondLetter, secondPattern) in braileMap {
      let combined = braileAdd(firstPattern, secondPattern)

      if combined == targetPattern {
        return firstLetter + "+" + secondLetter
      }
    }
  }

  ""
}

#let braileCombinationCypher(word: str) = {
  let out = ()

  for c in word.clusters() {
    let lc = lower(c)
    let translation = braileMap.at(lc, default: (0, 0, 0, 0, 0, 0))

    if translation == (0, 0, 0, 0, 0, 0) {
      if lc == " " {
        continue
      }

      out.push(c)
      continue
    }

    out.push(braileCombinationFor(translation))
  }

  out.join(" ")
}

#let braileSubtraction(pair: ((int, int, int, int, int, int), (int, int, int, int, int, int))) = {
  let out = ()

  for i in range(0, 6) {
    out.push(pair.first[i] - pair.second[i])
  }

  for i in range(0, 6) {
    if out[i] < 0 {
      out[i] = 0
    } else if out[i] > 1 {
      out[i] = 1
    }
  }
  out
}

#let braileSubstractionCypher(word: str) = {
  let out = ()

  for c in word.clusters() {
    let lc = lower(c)
    let translation = toBraileMap.at(lc, default: (0, 0, 0, 0, 0, 0))

    if translation == (0, 0, 0, 0, 0, 0) {
      continue
    }

    out.push(translation)
  }

  out
}
