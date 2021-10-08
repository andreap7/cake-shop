import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_flutter/fav/fav_bloc.dart';
import 'package:hello_flutter/fav/fav_event.dart';
import 'package:hello_flutter/fav/fav_state.dart';
import 'package:hello_flutter/nav/nav_bloc.dart';
import 'package:hello_flutter/nav/nav_event.dart';
import 'package:hello_flutter/nav/nav_state.dart';
import 'package:hello_flutter/quantity/quantity_bloc.dart';
import 'package:hello_flutter/quantity/quantity_event.dart';
import 'package:hello_flutter/quantity/quantity_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(
        refreshingIcon: Icon(Icons.refresh),
        completeText: 'successfullyRefreshed',
        refreshingText: 'refreshing',
        releaseText: 'releaseToRefresh',
        idleText: 'pullDownToRefresh',
      ),
      footerBuilder: () => ClassicFooter(
        loadingIcon: const Icon(Icons.refresh),
        canLoadingText: 'releaseToLoadMore',
        loadingText: 'loading',
        idleText: 'pullToLoadMore',
        idleIcon: Container(),
        noMoreIcon: const Icon(Icons.no_accounts),
      ),
      headerTriggerDistance: 80.0,
      springDescription:
          const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color(0xff7b7517)),
        debugShowCheckedModeBanner: false,
        home: const CakePage(),
      ),
    );
  }
}

class CakePage extends StatefulWidget {
  const CakePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CakePage> createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => QuantityBloc(),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: const Color(0xff2f304f),
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          actions: [
            BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                return IconButton(
                  tooltip: 'Favourite',
                  icon: (state.pressed)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    context.read<FavouriteBloc>().add(FavouritePressedEvent());
                  },
                );
              },
            )
          ],
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
        body: BlocConsumer<NavigationBloc, NavigationState>(
          listener: (context, navigationState) {
            if (navigationState.status == NavigationStateStatus.refreshed) {
              _refreshController.refreshCompleted();
            }
          },
          builder: (context, state) {
            return SmartRefresher(
              onRefresh: () async {
                context.read<NavigationBloc>().add(NavigationRefreshEvent());
              },
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              child: SingleChildScrollView(
                child: Column(
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
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xff7b7517)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          NavButton(
                            index: 0,
                            text: '1kg',
                          ),
                          NavButton(
                            index: 1,
                            text: '2kg',
                          ),
                          NavButton(
                            index: 2,
                            text: '3kg',
                          ),
                          NavButton(
                            index: 3,
                            text: '4kg',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        BlocBuilder<NavigationBloc, NavigationState>(
                          builder: (context, state) {
                            if (state.status == NavigationStateStatus.loading) {
                              return Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 5.0, 5.0, 5.0),
                                height: 250.0,
                                width: 250.0,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            }

                            return Container(
                              margin: const EdgeInsets.fromLTRB(
                                  20.0, 5.0, 5.0, 5.0),
                              height: 250.0,
                              width: 250.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(state.url),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 60.0,
                        ),
                        BlocBuilder<QuantityBloc, QuantityState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                InkWell(
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    context
                                        .read<QuantityBloc>()
                                        .add(IncrementEvent());
                                  },
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
                                  child: Center(
                                    child: Text(
                                      state.quantity.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  onTap: () {
                                    context
                                        .read<QuantityBloc>()
                                        .add(DecrementEvent());
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    BlocBuilder<QuantityBloc, QuantityState>(
                      builder: (context, state) {
                        double price = 84.99 * state.quantity;
                        String bigNum = price.toInt().toString();
                        String smallNum = (price - price.toInt())
                            .toStringAsFixed(2)
                            .split('.')[1];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$$bigNum.',
                              style: const TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, right: 25.0),
                              child: Text(
                                smallNum,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: BlocBuilder<NavigationBloc, NavigationState>(
                        builder: (context, state) {
                          int quantityEggs = 4 + state.index * 4;
                          int quantityVanilla = 2 + state.index * 2;
                          int quantitySugar = 1 + state.index;

                          return Row(
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
                                  children: [
                                    const Image(
                                      height: 50.0,
                                      image: AssetImage('assets/eggs.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '${quantityEggs.toString()} Eggs',
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  children: [
                                    const Image(
                                      height: 50.0,
                                      image: AssetImage('assets/cupcake.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '${quantityVanilla.toString()} tsp vanilla',
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  children: [
                                    const Image(
                                      height: 50.0,
                                      image: AssetImage('assets/sugar.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '${quantitySugar.toString()} ${quantitySugar == 1 ? 'cup' : 'cups'} sugar',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
              ),
            );
          },
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final int index;
  final String text;
  const NavButton({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<NavigationBloc>()
                .add(ButtonClickedEvent(index: index));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
                color: state.index == index
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                border: Border.all(width: 1.0, color: const Color(0xff7b7517)),
                borderRadius: BorderRadius.circular(25.0)),
            child: Text(
              text,
              style: TextStyle(
                color: state.index == index
                    ? Colors.white
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
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
