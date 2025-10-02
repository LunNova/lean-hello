def helloWorld : String := "Hello the second"

def main : IO Unit := do
  IO.println "Hello, World!"
  IO.println helloWorld

#eval main
