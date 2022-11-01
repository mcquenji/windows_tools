import 'package:fluent_ui/fluent_ui.dart';

void main() {
  // runThemedApp(appBuilder: (context) => const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Windows Tools',
    );
  }
}
