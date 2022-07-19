import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/map/PlayMap.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';
import 'package:r6splannerboard/widget/PlayMapWidget.dart';
import 'package:r6splannerboard/widget/drawer/AttackOperatorDrawer.dart';
import 'package:r6splannerboard/widget/drawer/DefenseOperatorDrawer.dart';
import 'package:r6splannerboard/widget/drawer/PlayMapDrawer.dart';
import 'package:r6splannerboard/widget/moveicon/MoveIcon.dart';
import 'package:r6splannerboard/widget/panel/MoveIconButtonPanel.dart';
import 'package:r6splannerboard/widget/panel/SketchButtonPanel.dart';
import 'package:r6splannerboard/widget/panel/interface/OptionPanel.dart';
import 'package:r6splannerboard/widget/sketch/SketchMode.dart';
import 'package:r6splannerboard/widget/sketch/interface/Sketch.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/map/Floor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Rainbow Six Siege Planner Board';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

///##### Build Class #####
class MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///##### Field #####
  final double mapWidth = 1250;
  final double mapHeight = 938;

  //TeamColor
  final attackTeamColor = const Color(0xFF1184E1);
  final defenseTeamColor = const Color(0xFFE97015);

  //PlayMap
  PlayMap playMap = PlayMap.BANK;
  Floor floor = Floor.F1;

  //Drawer TeamType
  TeamType _teamType = TeamType.attack;

  //MoveIcon
  final Set<MoveIcon> _moveIconSet = {};
  OptionPanel? _optionPanel;

  //Sketch
  SketchMode sketchMode = SketchMode.ARROW;
  Color sketchColor = Colors.red;
  final Set<Sketch> _sketchSet = {};
  Sketch? sketchTarget;
  final Map<SketchMode, int> _sketchThicknessMap = {
    SketchMode.ARROW: 5,
    SketchMode.SQUARE: 0,
    SketchMode.SQUARE_BORDER: 5,
    SketchMode.LINE: 5,
    SketchMode.CIRCLE: 5,
    SketchMode.CROSS_MARK: 5,
  };
  final Map<SketchMode, int> _sketchOpacityMap = {
    SketchMode.ARROW: 10,
    SketchMode.SQUARE: 5,
    SketchMode.SQUARE_BORDER: 10,
    SketchMode.LINE: 10,
    SketchMode.CIRCLE: 10,
    SketchMode.CROSS_MARK: 10,
  };

  ///##### Display List #####
  _displayList() {
    final List<Widget> list = [PlayMapWidget(this).mapImage()]; //Create List and Add PlayMapWidget Image

    //Add Sketch
    for (final sketch in _sketchSet) {
      list.add(sketch.widget());
    }
    //Add PlayMapWidget GestureDetector
    list.add(PlayMapWidget(this).gestureDetector());

    //Add MoveIcon
    for (final moveIcon in _moveIconSet) {
      list.add(moveIcon.widget());
    }

    //Add OptionPanel
    if (_optionPanel != null) list.add(_optionPanel!.optionPanel());

    return list;
  }

  ///##### MoveIcon Function #####
  addMoveIcon(MoveIcon moveIcon) {
    _moveIconSet.add(moveIcon);
  }

  removeMoveIcon(MoveIcon moveIcon) {
    _moveIconSet.remove(moveIcon);
  }

  ///##### Sketch Function #####
  addSketch(Sketch sketch) {
    _sketchSet.add(sketch);
  }

  undoSketch() {
    setState(() {
      try {
        _sketchSet.remove(_sketchSet.last);
      } catch (_) {}
    });
  }

  clearSketch() {
    setState(() {
      _sketchSet.clear();
    });
  }

  setSketchTarget(Sketch sketch) {
    sketchTarget = sketch;
  }

  removeSketchTarget() {
    sketchTarget = null;
  }

  getSketchThickness(SketchMode sketchMode) => _sketchThicknessMap[sketchMode]!.toDouble();

  addSketchThickness(SketchMode sketchMode) {
    if (sketchMode == SketchMode.SQUARE) return;
    if (_sketchThicknessMap[sketchMode] == 10) return;
    _sketchThicknessMap[sketchMode] = _sketchThicknessMap[sketchMode]! + 1;
  }

  removeSketchThickness(SketchMode sketchMode) {
    if (sketchMode == SketchMode.SQUARE) return;
    if (_sketchThicknessMap[sketchMode] == 1) return;
    _sketchThicknessMap[sketchMode] = _sketchThicknessMap[sketchMode]! - 1;
  }

  getSketchOpacity(SketchMode sketchMode) => _sketchOpacityMap[sketchMode]!.toDouble() / 10;

  addSketchOpacity(SketchMode sketchMode) {
    if (_sketchOpacityMap[sketchMode] == 10) return;
    _sketchOpacityMap[sketchMode] = _sketchOpacityMap[sketchMode]! + 1;
  }

  removeSketchOpacity(SketchMode sketchMode) {
    if (_sketchOpacityMap[sketchMode] == 1) return;
    _sketchOpacityMap[sketchMode] = _sketchOpacityMap[sketchMode]! - 1;
  }

  ///##### Set or Remove OptionPanel Target #####
  setOptionPanel(OptionPanel optionPanel) {
    _optionPanel = optionPanel;
  }

  closeOptionPanel() {
    _optionPanel = null;
  }

  ///##### OperatorDrawer Function #####
  Drawer _loadOpDrawer() {
    if (_teamType == TeamType.attack) {
      return AttackOpDrawer(this).getDrawer();
    }
    return DefenseOpDrawer(this).getDrawer();
  }

  void openAttackOpDrawer() {
    setState(() {
      closeOptionPanel();
      _teamType = TeamType.attack;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  void openDefenseOpDrawer() {
    setState(() {
      closeOptionPanel();
      _teamType = TeamType.defense;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  ///##### PlayMap Function #####
  _playMapActions() {
    final list = <Widget>[];

    for (final floor in playMap.hasFloor.values()) {
      final Color color;
      if (this.floor == floor) {
        color = Colors.lightBlue.shade200;
      } else {
        color = Colors.white;
      }

      list.add(Builder(
          builder: (context) => TextButton(
                onPressed: () {
                  setState(() {
                    closeOptionPanel();
                    setFloor(floor);
                  });
                },
                child: Text(floor.string, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600)),
              )));
    }

    //Last Add
    list.add(Builder(
        builder: (context) => IconButton(
              icon: const Icon(Icons.map_outlined),
              onPressed: () {
                setState(() {
                  closeOptionPanel();
                  Scaffold.of(context).openEndDrawer();
                });
              },
              tooltip: "맵 선택",
            )));

    return list;
  }

  setPlayMap(PlayMap playMap) {
    setState(() {
      floor = Floor.F1;
      this.playMap = playMap;
    });
  }

  setFloor(Floor floor) {
    if (playMap.hasFloor.contains(floor)) {
      setState(() {
        this.floor = floor;
      });
    }
  }

  ///##### Leading Function #####
  _leading() => Builder(
      builder: (context) => IconButton(
        onPressed: () {
          setState(() {
            closeOptionPanel();
            launchUrl(Uri.parse('https://github.com/MineStarAS/r6splannerboard'));
          });
        },
        tooltip: "Open browser",
        icon: const Icon(UniconsLine.github),
      ));

  ///##### Build Function #####
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Rainbow Six Siege Planner Board'),
        automaticallyImplyLeading: false,
        leading: _leading(),
        actions: _playMapActions(),
      ),

      ///Display
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [MoveIconButtonPanel(this).widget(), Center(child: Stack(children: _displayList())), SketchButtonPanel(this).widget()]),
      ),

      ///Drawer
      drawer: _loadOpDrawer(),
      endDrawer: PlayMapDrawer(this).getDrawer(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
    );
  }
}
