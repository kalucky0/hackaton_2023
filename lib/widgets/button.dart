import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Button extends StatelessWidget {
  const Button({
    this.height,
    this.width,
    this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocBuilder<ButtonCubit, bool>(
        builder: (context, state) {
          final cubit = context.read<ButtonCubit>();
          return GestureDetector(
            onTap: onTap,
            onTapDown: (_) => cubit.press(),
            onTapUp: (_) => cubit.release(),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color:
                    state ? Color.fromARGB(255, 241, 241, 241) : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}

class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false);

  void press() => emit(true);

  void release() => emit(false);
}
