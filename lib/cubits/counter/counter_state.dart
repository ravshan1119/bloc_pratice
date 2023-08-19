class CounterState {
  final num numOne;
  final num numTwo;
  num summa;

  CounterState({
    this.numOne = 1,
    this.numTwo = 1,
    this.summa=0,
  });

  CounterState copyWith({
    num? numOne,
    num? numTwo,
    num? summa,
  }) =>
      CounterState(
        numOne: numOne ?? this.numOne,
        numTwo: numTwo ?? this.numTwo,
        summa: summa ?? this.summa,
      );

  factory CounterState.fromJson(Map<String, dynamic> json) => CounterState();

  @override
  String toString() {
    return '''
    Username: $numOne
    UserAge:$numTwo
    ''';
  }
}