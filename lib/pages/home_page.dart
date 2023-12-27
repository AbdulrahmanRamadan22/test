import 'package:flutter/material.dart';
import 'package:login_firebase/models/Charitie.dart';
import 'package:login_firebase/pages/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Charitie>? charitie;
  int count = 0;
  @override
  void initState() {
    super.initState();
    Charitie().saveDataOnce(Charitie().addCharities());
    loadList();
  }

  Future<void> loadList() async {
    final loadedList = await Charitie().readData();
    setState(() {
      charitie = loadedList;
      count = charitie!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AccountPage");
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: 40,
                  )),
            )
          ],
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: const Text(
            "الصفحة الرئيسية ",
            // style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: <Widget>[
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/plastaine.jpg'),
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: count,
                itemBuilder: (BuildContext context,  index) {
                  return customCard(
                    charitie: charitie![index],
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class customCard extends StatelessWidget {
  const customCard({super.key, required this.charitie});

  final Charitie charitie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => data(
                      charitie: charitie,
                    )));
      },
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image(
                image: AssetImage(charitie.image ?? 'null'),
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    charitie.name ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
