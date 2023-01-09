import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class BlocTestStep<B extends BlocBase<State>, State, Fixture> {
  final String description;
  final FutureOr Function()? setUp;
  final FutureOr Function(B bloc, Fixture fixture)? act;
  final List<State> Function()? expect;
  final Function(B bloc, Fixture fixture)? verify;

  BlocTestStep(
    this.description, {
    this.setUp,
    this.act,
    this.expect,
    this.verify,
  });
}

@isTest
void multiStepBlocTest<B extends BlocBase<State>, State, Fixture>(
  String description, {
  required FutureOr<Fixture> Function() setUp,
  required B Function() build,
  required List<BlocTestStep<B, State, Fixture>> steps,
  State Function()? seed,
  FutureOr<void> Function(Fixture)? tearDown,
}) async {
  test(description, () async {
    final fixture = await setUp.call();
    final states = <State>[];
    final bloc = build();
    if (seed != null) bloc.emit(seed());
    final subscription = bloc.stream.listen(states.add);

    for (final step in steps) {
      await step.setUp?.call();
      await step.act?.call(bloc, fixture);
      await Future.delayed(Duration.zero);

      final expectedStates = step.expect?.call();
      if (expectedStates != null) {
        expect(states, expectedStates);
      }

      await step.verify?.call(bloc, fixture);
      states.clear();
    }

    await subscription.cancel();
    await tearDown?.call(fixture);
  });
}
