import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cake extends StatelessWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: const Color(0xff2f304f),
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          actions: const [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.favorite_border),
            )
          ],
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Fruits Cake',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'strawberry & kiwi special',
                    style: TextStyle(fontSize: 18.0, color: Color(0xff7b7517)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                              color: const Color(0xff7b7517),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff7b7517)),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            child: const Text(
                              '1kg',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                              //color: Color(0xff7b7517),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff7b7517)),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            child: const Text(
                              '2kg',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                              //color: Color(0xff7b7517),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff7b7517)),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            child: const Text(
                              '3kg',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                              //color: Color(0xff7b7517),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff7b7517)),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            child: const Text(
                              '4kg',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                        height: 250.0,
                        width: 250.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/cake.png')),
                        ),
                      ),
                      const SizedBox(
                        width: 60.0,
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff7b7517),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        '\$84.',
                        style: TextStyle(
                            fontSize: 36.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, right: 25.0),
                        child: Text(
                          '99',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff212129),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                            ),
                          ),
                          width: 120.0,
                          height: 100.0,
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: const [
                              Image(
                                height: 50.0,
                                image: AssetImage('assets/eggs.png'),
                                fit: BoxFit.fill,
                              ),
                              Text(
                                '4 Eggs',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0xff212129),
                            border: Border(
                              left: BorderSide(
                                color: Color(0xff8f9094),
                              ),
                              right: BorderSide(
                                color: Color(0xff8f9094),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: const [
                              Image(
                                height: 50.0,
                                image: AssetImage('assets/cupcake.png'),
                                fit: BoxFit.fill,
                              ),
                              Text(
                                '2 tsp vanilla',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0xff212129),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: const [
                              Image(
                                height: 50.0,
                                image: AssetImage('assets/sugar.png'),
                                fit: BoxFit.fill,
                              ),
                              Text(
                                '1 cup sugar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 120.0,
                        padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                        child: const Image(
                          image: AssetImage('assets/map.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'DELIVERY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '45, Amarlands',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Nr. Hamer Road, London',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                    child: Row(
                      children: [
                        const Text(
                          'Ratings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Color(0xffffeb38),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffffeb38),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffffeb38),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffffeb38),
                            ),
                            HalfFilledIcon(
                              icon: Icons.star,
                              size: 25,
                              color: Color(0xffffeb38),
                            ),
                            Text(
                              '(55)',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
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

class HalfFilledIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const HalfFilledIcon({
    Key? key,
    required this.icon,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: const [0, 0.5, 0.5],
          colors: [color, color, color.withOpacity(0)],
        ).createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: size, color: const Color(0xff2f304f)),
      ),
    );
  }
}
