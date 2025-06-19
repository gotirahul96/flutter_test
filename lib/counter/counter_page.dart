// COUNTER OAGE: responsible for providing CounterCubit to counterview (UI)
// - user BlocProvider 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/counter/counter_cubit.dart';
import 'package:testapp/counter/counter_view.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //bloc provider
    return BlocProvider(
      create: (context) => CounterCubit(0),
      //counter view (Ui)
      child: CounterView(),
    );
  }
}