import 'package:bloc/bloc.dart';

// class ButtonValue {
//   int initialState;
//   ButtonValue(this.initialState);
// }

class TrialButton extends Cubit<int> {
    TrialButton():super(0);

    void increment ()=> emit(state + 1);

    void decrement ()=> emit (state -1);
}
