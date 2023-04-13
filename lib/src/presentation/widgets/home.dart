import 'package:aer_v2/src/presentation/widgets/bottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _controller;
  bool _isVisible = true;
  bool _isElevated = true;
  bool _showFab = true;

  static const List<Color> colors = <Color>[
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.cyanAccent
  ];

  static final List<Widget> items = List<Widget>.generate(
      colors.length,
      (index) => Container(
            color: colors[index],
            height: 150.0,
          )).reversed.toList();

  FloatingActionButtonLocation get _fabLocation => _isVisible
      ? FloatingActionButtonLocation.endContained
      : FloatingActionButtonLocation.endFloat;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onElevatedChanged(bool value) {
    setState(() {
      _isElevated = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("aer"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _controller,
              children: items.toList(),
            ),
          ),
        ],
      )),
      bottomNavigationBar: NavAppBar(
        isElevated: _isElevated,
        isVisible: _isVisible,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aer');
        },
        tooltip: 'Add new treat',
        elevation: 3,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: _fabLocation,
    );
  }
}
