## Equatable benchmark

### Environment
Machine: MacBook Pro M1 Pro 10 cores
Dart VM 3.2.0

### Results from the `master` branch. Commit hash is 725b76c
Empty equatable
          total runs:  1 376 727
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000

Equatable with primitives
          total runs:    792 237
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000

Equatable with small collections
          total runs:    457 085
          total time:     2.0000  s
         average run:          4 μs
         runs/second:    250 000

Equatable with large collections
          total runs:        800
          total time:     2.0017  s
         average run:     2.5020 ms
         runs/second:     399.68

### Results from `feat/performance-improvement` branch. Commit hash is 6204491
Empty equatable
          total runs:  1 345 542   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000

Equatable with primitives
          total runs:    781 633   
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000

Equatable with small collections
          total runs:    538 559   
          total time:     2.0000  s
         average run:          3 μs
         runs/second:    333 333

Equatable with large collections
          total runs:     47 654   
          total time:     2.0000  s
         average run:         41 μs
         runs/second:     24 390
