def main [number: int] {
  let url = $"http://numbersapi.com/($number)"
  let result = http get $url
  print $"Fact about ($number): ($result)"
}
