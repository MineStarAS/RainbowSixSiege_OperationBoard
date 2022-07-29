// ignore_for_file: must_call_super

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/map/PlayMap.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';
import 'package:r6splannerboard/widget/playmap/PlayMapGesture.dart';
import 'package:r6splannerboard/widget/playmap/PlayMapWidget.dart';
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
  @override
  initState() {
    DesktopWindow.setMinWindowSize(const Size(1686, 825));
    DesktopWindow.setFullScreen(true);

    for (PlayMap playMap in PlayMap.values) {
      final Map<Floor, Set<MoveIcon>> moveIconMap = {};
      final Map<Floor, Set<Sketch>> sketchMap = {};
      final Map<Floor, double> playMapOffsetYMap = {};
      final Map<Floor, double> playMapOffsetXMap = {};
      final Map<Floor, double> playMapScaleMap = {};
      for (Floor floor in playMap.hasFloor.values()) {
        moveIconMap[floor] = {};
        sketchMap[floor] = {};
        playMapOffsetYMap[floor] = 0;
        playMapOffsetXMap[floor] = 0;
        playMapScaleMap[floor] = 1;
      }
      _moveIconMap[playMap] = moveIconMap;
      _sketchMap[playMap] = sketchMap;
      _playMapOffsetX[playMap] = playMapOffsetYMap;
      _playMapOffsetY[playMap] = playMapOffsetXMap;
      _playMapScale[playMap] = playMapScaleMap;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///##### Field #####
  //PlayMap
  PlayMap playMap = PlayMap.BANK;
  Floor floor = Floor.F1;

  final double mapWidth = 1250;
  final double mapHeight = 938;

  final Map<PlayMap, Map<Floor, double>> _playMapOffsetX = {};
  final Map<PlayMap, Map<Floor, double>> _playMapOffsetY = {};
  final Map<PlayMap, Map<Floor, double>> _playMapScale = {};

  final double zoomInLimit = 3;
  final double _zoomStep = 0.1;

  //TeamColor
  final attackTeamColor = const Color(0xFF1184E1);
  final defenseTeamColor = const Color(0xFFE97015);

  //Drawer TeamType
  TeamType _teamType = TeamType.attack;

  //MoveIcon
  final Map<PlayMap, Map<Floor, Set<MoveIcon>>> _moveIconMap = {};

  Set<MoveIcon> _moveIconSet() => _moveIconMap[playMap]![floor]!;

  OptionPanel? _optionPanel;

  //Sketch
  SketchMode sketchMode = SketchMode.ARROW;
  Color sketchColor = Colors.red;

  final Map<PlayMap, Map<Floor, Set<Sketch>>> _sketchMap = {};

  Set<Sketch> _sketchSet() => _sketchMap[playMap]![floor]!;

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

  //Debug
  String? _debug;

  debug(Object? object) {
    setState(() {
      _debug = object.toString();
    });
    return object.toString();
  }

  ///##### Display List #####
  _displayList() {
    //Create List and Add PlayMapWidget Image
    final List<Widget> list = [PlayMapWidget(this).widget()];

    //Add Sketch
    for (final sketch in _sketchSet()) {
      list.add(sketch.widget());
    }
    //Add PlayMapWidget GestureDetector
    list.add(PlayMapGesture(this).widget());

    //Add MoveIcon
    for (final moveIcon in _moveIconSet()) {
      list.add(moveIcon.widget());
    }

    //Add OptionPanel
    if (_optionPanel != null) list.add(_optionPanel!.optionPanel());

    return list;
  }

  ///##### PlayMap Function #####
  double getPlayMapOffsetX() => _playMapOffsetX[playMap]![floor]!;

  double getPlayMapOffsetY() => _playMapOffsetY[playMap]![floor]!;

  double getPlayMapScale() => _playMapScale[playMap]![floor]!;

  addPlayMapOffsetX(double offsetX) {
    var newValue = _playMapOffsetX[playMap]![floor]! + offsetX;
    if (mapWidth < newValue.abs()) return;
    if (getPlayMapScale() == 1.0) return;
    _playMapOffsetX[playMap]![floor] = newValue;
  }

  addPlayMapOffsetY(double offsetY) {
    var newValue = _playMapOffsetY[playMap]![floor]! + offsetY;
    if (mapHeight < newValue.abs()) return;
    if (getPlayMapScale() == 1.0) return;
    _playMapOffsetY[playMap]![floor] = newValue;
  }

  addPlayMapScale() {
    final value = _playMapScale[playMap]![floor]!;
    if (zoomInLimit <= value) return;
    var newValue = value + _zoomStep;
    if (zoomInLimit < newValue) newValue = zoomInLimit;
    _playMapScale[playMap]![floor] = newValue;
  }

  removePlayMapScale() {
    var newValue = _playMapScale[playMap]![floor]! - _zoomStep;
    if (newValue < 1.0) newValue = 1.0;
    _playMapScale[playMap]![floor] = newValue;
  }

  ///##### MoveIcon Function #####
  addMoveIcon(MoveIcon moveIcon) => _moveIconSet().add(moveIcon);

  removeMoveIcon(MoveIcon moveIcon) => _moveIconSet().remove(moveIcon);

  ///##### Sketch Function #####
  addSketch(Sketch sketch) => _sketchSet().add(sketch);

  undoSketch() => setState(() {
        try {
          _sketchSet().remove(_sketchSet().last);
        } catch (_) {}
      });

  clearSketch() => setState(() {
        _sketchSet().clear();
      });

  setSketchTarget(Sketch sketch) => sketchTarget = sketch;

  removeSketchTarget() => sketchTarget = null;

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
  setOptionPanel(OptionPanel optionPanel) => _optionPanel = optionPanel;

  closeOptionPanel() => _optionPanel = null;

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

    //DebugDisplay
    if (_debug != null) {
      list.add(Builder(
          builder: (context) => TextButton(
                onPressed: () {},
                child: Text(_debug!, style: const TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.w600)),
              )));
    }

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

      ///AppBar
      appBar: AppBar(
        title: const Text('Rainbow Six Siege Planner Board'),
        automaticallyImplyLeading: false,
        leading: _leading(),
        actions: _playMapActions(),
      ),

      ///Display
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [MoveIconButtonPanel(this).widget(), Center(child: Stack(children: _displayList())), SketchButtonPanel(this).widget()],
      )),

      ///Drawer
      drawer: _loadOpDrawer(),
      endDrawer: PlayMapDrawer(this).getDrawer(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
    );
  }
}
