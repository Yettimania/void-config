def main [] {
  # Calculate fibonacci for multiple numbers in parallel
  let numbers = [30, 31, 32, 33, 34, 35]
  
  print "Computing fibonacci numbers in parallel..."
  
  $numbers | par-each { |n|
    let fib = (fibonacci $n)
    { input: $n, result: $fib }
  }
}

def fibonacci [n: int]  {
  if $n <= 1 {
    $n
  } else {
    (fibonacci ($n - 1)) + (fibonacci ($n - 2))
  }
}
