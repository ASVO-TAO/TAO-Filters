import sys

def main():
   """
   Get the name from the command line, using 'World' as a fallback.
   """

   if len(sys.argv) >= 2:
     name = sys.argv[1]
     total = 0
     try:
        with open(name, 'r') as f:
           Lines = f.readlines() 
           for line in Lines: 
              tokens = line.strip().split()
              if len(tokens) == 2:
                  as_micron = float(tokens[0])
                  as_angstrom = as_micron*10000.0
                  transmission = float(tokens[1])
                  total += transmission
     except:
        print("could not open")
     try:
        normalise = total
        total = 0
        with open(name, 'r') as f:
           Lines = f.readlines() 
           for line in Lines: 
              tokens = line.strip().split()
              if len(tokens) == 2:
                  as_micron = float(tokens[0])
                  as_angstrom = as_micron*10000.0
                  transmission = float(tokens[1])
                  transmission /= normalise
                  total += transmission
                  print("{0:5.0f} {1:12.10f}".format(as_angstrom,transmission))
              else:
                  print(line.strip())
     except:
        print("could not open")

if __name__ == "__main__":
    main()
