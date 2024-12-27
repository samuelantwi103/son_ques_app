import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';

class AdminPerformancePage extends StatefulWidget {
  // final String title;
  const AdminPerformancePage({super.key});

  @override
  State<AdminPerformancePage> createState() => _AdminPerformancePageState();
}

class _AdminPerformancePageState extends State<AdminPerformancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: SizedBox(),
        title: Text("P E R F O R M A N C E"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Students",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ElevatedCard(
                        child: ListTile(
                      // color: Theme.of(context).colorScheme.surface,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Student ${index + 1}"),
                      ),
                      subtitle: DebossedCard(
                        padding: EdgeInsets.all(0),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          value: 0.6,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: 4),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add_alt_outlined),
      ),
    );
  }
}
