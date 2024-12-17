import 'package:ca_firebase_app/export.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Text('Main Page'),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, HomePage.route());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.whiteColor,
                    foregroundColor: AppPallete.errorColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text('DP Todo home screen'))
          ],
        )),
      ),
    );
  }
}
