import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc/counter_bloc.dart';
import '../blocs/counter_bloc/counter_event.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '$state',
                  key: ValueKey<int>(state),
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDreamyButton(
                context,
                icon: Icons.remove,
                onTap: () => counterBloc.add(DecrementCounter()),
              ),
              const SizedBox(width: 30),
              _buildDreamyButton(
                context,
                icon: Icons.add,
                onTap: () => counterBloc.add(IncrementCounter()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDreamyButton(BuildContext context,
      {required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.deepPurpleAccent,
            ],
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        width: 70,
        height: 70,
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}
