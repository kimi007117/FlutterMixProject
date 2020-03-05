import 'package:meta/meta.dart';

@immutable
class CountState {
  final int _count;

  get count => _count;

  CountState(this._count);

  CountState.initState() : _count = 0;
}
