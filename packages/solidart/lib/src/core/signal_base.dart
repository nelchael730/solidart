// coverage:ignore-file

import 'package:meta/meta.dart';
import 'package:solidart/src/core/signal_options.dart';
import 'package:solidart/src/utils.dart';

/// The base of a signal.
abstract class SignalBase<T> extends Listenable {
  /// The current signal value
  @useResult
  T get value;

  /// The current signal value
  @useResult
  T call();

  /// The previous signal value
  ///
  /// Defaults to null when no previous value is present.
  @useResult
  T? get previousValue;

  /// Options used to customize the behaviour of a signal
  @useResult
  SignalOptions<T> get options;

  /// Tells if the signal is disposed;
  @useResult
  bool get disposed;

  /// Fired when the signal is disposing
  void onDispose(VoidCallback cb);

  /// The total number of listeners subscribed to the signal.
  @useResult
  int get listenerCount;

  /// Diposes the signal
  void dispose();
}

/// An object that maintains a list of listeners.
///
/// The listeners are typically used to notify clients that the object has been
/// updated.
abstract class Listenable {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const Listenable();

  /// Register a closure to be called when the object notifies its listeners.
  void addListener(VoidCallback listener);

  /// Remove a previously registered closure from the list of closures that the
  /// object notifies.
  void removeListener(VoidCallback listener);
}
