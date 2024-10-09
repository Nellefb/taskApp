import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/provider/task_group_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wcmulyckffbivatnjgdq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndjbXVseWNrZmZiaXZhdG5qZ2RxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0MzQ1OTUsImV4cCI6MjA0NDAxMDU5NX0.DsUmtu9waU_MxD-KuP2522uOD2exswrIJuIkE9ieZM0',
  );

//provider antes do myapp para ser disponivel em todo o app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskGroupProvider()..listTaskGroups(),),
      ],
      child: const MyApp(),
     )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task APP',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

//https://www.canva.com/design/DAGS8auAPo8/IPENR23lzioTNNhCVi0Qnw/edit