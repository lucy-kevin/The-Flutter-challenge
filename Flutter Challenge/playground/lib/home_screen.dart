import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider) ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          )
        ],
      ),
    );
  }
}

class MyScreen extends ConsumerStatefulWidget {
  const MyScreen({super.key});

  @override
  ConsumerState<MyScreen> createState() => _MyScreenState();
}

@override
class _MyScreenState extends ConsumerState<MyScreen> {
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider) ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
