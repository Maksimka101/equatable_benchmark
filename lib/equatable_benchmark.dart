import 'package:benchmarking/benchmarking.dart';
import 'package:equatable/equatable.dart';

class EmptyEquatable extends Equatable {
  @override
  List<Object?> get props => [];
}

class EquatableWithPrimitives extends Equatable {
  const EquatableWithPrimitives(this.number, this.string, this.boolean);

  final int number;
  final String string;
  final bool boolean;

  @override
  List<Object?> get props => [number, string, boolean];
}

class EquatableWithDataStructures extends Equatable {
  const EquatableWithDataStructures(this.list, this.map, this.st);

  final List<int> list;
  final Map<String, int> map;
  final Set<int> st;

  @override
  List<Object?> get props => [list, map, st];
}

/// Benchmark that measures performance of `==` operator by comparing them with each other.
class ComparisonBenchmark extends SyncBenchmark {
  ComparisonBenchmark(this.objects, String name) : super(name);

  final List<Object> objects;

  Object? result;

  @override
  void run() {
    for (final a in objects) {
      for (final b in objects) {
        result = a == b;
      }
    }
  }
}

void main() {
  final emptyEquatabels = generate((index) => EmptyEquatable());
  ComparisonBenchmark(emptyEquatabels, 'Empty equatable').measure().report();

  final equatableWithPrimitives = generate((index) => EquatableWithPrimitives(index, '$index', index.isEven));
  ComparisonBenchmark(equatableWithPrimitives, 'Equatable with primitives').measure().report();

  final equatableWithDataStructures = generate(
    (index) => EquatableWithDataStructures([index], {'$index': index}, {index}),
  );
  ComparisonBenchmark(equatableWithDataStructures, 'Equatable with small collections').measure().report();

  final equatableWithLargeDataStructure = generate(
    (index) => EquatableWithDataStructures(
      List.generate(100, (index) => index),
      Map.fromEntries(List.generate(100, (index) => MapEntry('$index', index))),
      List.generate(100, (index) => index).toSet(),
    ),
  );
  ComparisonBenchmark(equatableWithLargeDataStructure, 'Equatable with large collections').measure().report();
}

List<T> generate<T>(T Function(int index) generator) {
  return List.generate(10, generator);
}
