import 'dart:async';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trabalho2/populating/jogos.dart';
import 'package:trabalho2/screens/competition_page.dart';
import 'package:trabalho2/screens/jogadores_page_all.dart';
import 'package:trabalho2/screens/jogos_page.dart';
import 'package:trabalho2/screens/clubes_page.dart';
import '../populating/corouselSlider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Widget> imageSliders = carouselSlider
    .map(
      (e) => Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    e.imagem,
                  ),
                  Text(
                    e.titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    .toList();

class _HomePageState extends State<HomePage> {
  var formattedTime = DateFormat('HH:mm:ss');
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        formattedTime;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now();

    List jogostempos = [];
    jogos.forEach((e) {
      jogostempos.add(e.gameStarts);
    });
    jogostempos.sort((a, b) {
      return a.compareTo(b);
    });
    DateTime endDate = jogostempos[0];
    debugPrint("${jogostempos[0]}");
    Duration dif = endDate.difference(startDate);
    String hora =
        "${dif.inHours}:${dif.inMinutes.remainder(60)}:${(dif.inSeconds.remainder(60))}";
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Liga Portuguesa',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/campo.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: SizedBox(
                      width: widthScreen - (widthScreen / 2),
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'images/background_app_image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 2,
                    child: Text(
                      hora,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const Center(
                    child: SizedBox(
                      height: 70,
                      child: Text(
                        'Before the next game!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 420,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 1),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: imageSliders,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: (widthScreen / 2) - 10,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'images/Competitions.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const CompetitionPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Competi????o',
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: (widthScreen / 2),
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'images/clube.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 50,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const ClubesPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Clubes',
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: (widthScreen / 2) - 10,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'images/players.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const JogadoresPageAll();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Jogadores',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: (widthScreen / 2),
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'images/soccer-ball-goal.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 50,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const JogosPage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Jogos',
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
