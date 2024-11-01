import 'package:animated_listview/custom_animated_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return CustomAnimatedCard(
                      itemIndex: index,
                      bgColor: Colors.purpleAccent,
                      scoreInCurrentDuration: "1",
                      userName: "userName",
                      userProfileURL:
                          "https://avatars.githubusercontent.com/u/92533130?v=4",
                      isCurrentUser: true,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.blueAccent,
            //     child: ListView.separated(
            //       physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemCount: 25,
            //       itemBuilder: (context, index) => Row(
            //         children: [
            //           const CircleAvatar(),
            //           const SizedBox(
            //             width: 25,
            //           ),
            //           Text(index.toString()),
            //         ],
            //       ),
            //       separatorBuilder: (context, index) => const SizedBox(
            //         height: 25,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
