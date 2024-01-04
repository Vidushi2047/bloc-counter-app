import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counter Value',
            style: TextStyle(fontSize: 35),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.isIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Incremented'),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state.isIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Decremented'),
                  duration: Duration(milliseconds: 300),
                ));
              }
            },
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    // context.bloc<CounterCubit>().increment();
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const CircleAvatar(
                      radius: 25, child: Center(child: Icon(Icons.add)))),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const CircleAvatar(
                      radius: 25, child: Center(child: Icon(Icons.remove))))
            ],
          )
        ],
      ),
    );
  }
}
