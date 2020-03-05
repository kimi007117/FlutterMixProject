import 'package:flutter_module/redux/count_action.dart';
import 'package:flutter_module/redux/count_state.dart';

/**
 * reducer会根据传进来的action生成新的CountState
 */
CountState reducer(CountState state, action) {
  //匹配Action
  if (action == Action.increment) {
    return CountState(state.count + 1);
  }
  return state;
}
