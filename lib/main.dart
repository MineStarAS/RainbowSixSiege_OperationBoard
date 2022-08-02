// ignore_for_file: must_call_super

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r6splannerboard/data/map/PlayMap.dart';
import 'package:r6splannerboard/widget/drawer/AttackOperatorDrawer.dart';
import 'package:r6splannerboard/widget/drawer/DefenseOperatorDrawer.dart';
import 'package:r6splannerboard/widget/drawer/DrawerType.dart';
import 'package:r6splannerboard/widget/drawer/PlayMapDrawer.dart';
import 'package:r6splannerboard/widget/drawer/PublicGadgetDrawer.dart';
import 'package:r6splannerboard/widget/moveicon/MoveIcon.dart';
import 'package:r6splannerboard/widget/panel/MoveIconButtonPanel.dart';
import 'package:r6splannerboard/widget/panel/SketchButtonPanel.dart';
import 'package:r6splannerboard/widget/panel/interface/OptionPanel.dart';
import 'package:r6splannerboard/widget/playmap/PlayMapGesture.dart';
import 'package:r6splannerboard/widget/playmap/PlayMapImage.dart';
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

  static const String _title = 'Rainbow Six: Siege Operation Board';

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
    DesktopWindow.setMinWindowSize(const Size(1686, 1026));
    DesktopWindow.setFullScreen(true);

    for (PlayMap playMap in PlayMap.values) {
      final Map<Floor, Set<MoveIcon>> moveIconMap = {};
      final Map<Floor, MoveIcon?> selectMoveIconMap = {};
      final Map<Floor, Set<Sketch>> sketchMap = {};
      final Map<Floor, Set<List<Sketch>>> sketchUndoMap = {};
      final Map<Floor, double> playMapOffsetYMap = {};
      final Map<Floor, double> playMapOffsetXMap = {};
      final Map<Floor, double> playMapScaleMap = {};
      for (Floor floor in playMap.hasFloor.values()) {
        moveIconMap[floor] = {};
        selectMoveIconMap[floor] = null;
        sketchMap[floor] = {};
        sketchUndoMap[floor] = {};
        playMapOffsetYMap[floor] = 0;
        playMapOffsetXMap[floor] = 0;
        playMapScaleMap[floor] = 1;
      }
      _moveIconMap[playMap] = moveIconMap;
      _selectMoveIconMap[playMap] = selectMoveIconMap;
      _sketchMap[playMap] = sketchMap;
      _sketchUndoMap[playMap] = sketchUndoMap;
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

  bool moveImageBoolean = false;

  //TeamColor
  final attackTeamColor = const Color(0xFF1184E1);
  final defenseTeamColor = const Color(0xFFE97015);

  //Drawer TeamType
  DrawerType _drawerType = DrawerType.attackOperator;

  //MoveIcon
  final Map<PlayMap, Map<Floor, Set<MoveIcon>>> _moveIconMap = {};
  final Map<PlayMap, Map<Floor, MoveIcon?>> _selectMoveIconMap = {};

  Set<MoveIcon> _moveIconSet() => _moveIconMap[playMap]![floor]!;

  MoveIcon? getSelectMoveIcon() {
    final moveIcon = _selectMoveIconMap[playMap]?[floor];
    return moveIcon;
  }

  void setSelectMoveIcon(MoveIcon? moveIcon) {
    _selectMoveIconMap[playMap]![floor] = moveIcon;
  }

  final double minMoveIconSize = 15;
  final double maxMoveIconSize = 50;
  double defaultMoveIconSize = 30;

  addDefaultMoveIconSize(double add) {
    defaultMoveIconSize += add;
    if (maxMoveIconSize < defaultMoveIconSize) {
      defaultMoveIconSize = maxMoveIconSize;
      return;
    } else if (defaultMoveIconSize < minMoveIconSize) {
      defaultMoveIconSize = minMoveIconSize;
      return;
    }
  }

  OptionPanel? _optionPanel;

  //Sketch
  SketchMode sketchMode = SketchMode.ARROW;
  Color sketchColor = Colors.red;

  final Map<PlayMap, Map<Floor, Set<Sketch>>> _sketchMap = {};
  final Map<PlayMap, Map<Floor, Set<List<Sketch>>>> _sketchUndoMap = {};

  Set<Sketch> _sketchSet() => _sketchMap[playMap]![floor]!;

  Set<List<Sketch>> _sketchUndoSet() => _sketchUndoMap[playMap]![floor]!;

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
    // ignore: avoid_print
    print(object);
  }

  ///##### Display List #####
  _displayList() {
    //Create List and Add PlayMapWidget Image
    final List<Widget> list = [PlayMapImage(this).widget()];

    //Add Sketch
    for (final sketch in _sketchSet()) {
      list.add(sketch.widget());
    }
    //Add PlayMapWidget GestureDetector
    list.add(PlayMapGesture(this).widget());

    //Add MoveIcon
    for (final moveIcon in _moveIconSet()) {
      if (0 > moveIcon.getPosX() || moveIcon.getPosX() + moveIcon.size > mapWidth) continue;
      if (0 > moveIcon.getPosY() || moveIcon.getPosY() + moveIcon.size > mapHeight) continue;
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

  clearMoveIcon() => _moveIconSet().clear();

  ///##### Sketch Function #####
  addSketch(Sketch sketch) {
    _sketchUndoSet().clear();
    _sketchSet().add(sketch);
  }

  undoSketch() => setState(() {
        final set = _sketchSet();
        if (set.isEmpty) return;
        _sketchUndoSet().add([set.last]);
        set.remove(set.last);
      });

  redoSketch() {
    final set = _sketchUndoSet();
    if (set.isEmpty) return;
    for (final sketch in set.last) {
      _sketchSet().add(sketch);
    }
    set.remove(set.last);
  }

  clearSketch() => setState(() {
        _sketchUndoSet().add(_sketchSet().toList());
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
    switch (_drawerType) {
      case DrawerType.attackOperator:
        return AttackOpDrawer(this).getDrawer();
      case DrawerType.defenseOperator:
        return DefenseOpDrawer(this).getDrawer();
      case DrawerType.publicGadget:
        return PublicGadgetDrawer(this).getDrawer();
    }
  }

  void openAttackOpDrawer() {
    setState(() {
      closeOptionPanel();
      _drawerType = DrawerType.attackOperator;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  void openDefenseOpDrawer() {
    setState(() {
      closeOptionPanel();
      _drawerType = DrawerType.defenseOperator;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  void openPublicGadgetDrawer() {
    setState(() {
      closeOptionPanel();
      _drawerType = DrawerType.publicGadget;
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
                child: Text(_debug!, style: const TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.w600, backgroundColor: Colors.white70)),
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

  ///##### KeyBoard Event Function #####
  _keyEvent(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;
    final key = event.logicalKey;
    final label = key.keyLabel;
    // debug(label);

    ///Key Kind
    final sketchModes = ["Q", "W", "E", "A", "S", "D"];
    final floors = ["1", "2", "3", "4", "5"];

    if (!event.isControlPressed && !event.isAltPressed && !event.isShiftPressed) {
      ///Select Color
      if (label.contains("Numpad")) {
        switch (label) {
          case "Numpad 1":
            sketchColor = Colors.white;
            break;
          case "Numpad 2":
            sketchColor = Colors.grey;
            break;
          case "Numpad 3":
            sketchColor = Colors.black;
            break;
          case "Numpad 4":
            sketchColor = Colors.green;
            break;
          case "Numpad 5":
            sketchColor = Colors.blue;
            break;
          case "Numpad 6":
            sketchColor = Colors.purple;
            break;
          case "Numpad 7":
            sketchColor = Colors.red;
            break;
          case "Numpad 8":
            sketchColor = Colors.orange;
            break;
          case "Numpad 9":
            sketchColor = Colors.yellow;
            break;
        }
        setState(() {});
        return;
      }

      ///Select Sketch Mode
      if (sketchModes.contains(label)) {
        switch (label) {
          case "Q":
            sketchMode = SketchMode.ARROW;
            break;
          case "W":
            sketchMode = SketchMode.SQUARE;
            break;
          case "E":
            sketchMode = SketchMode.SQUARE_BORDER;
            break;
          case "A":
            sketchMode = SketchMode.LINE;
            break;
          case "S":
            sketchMode = SketchMode.CIRCLE;
            break;
          case "D":
            sketchMode = SketchMode.CROSS_MARK;
            break;
        }
        setState(() {});
        return;
      }

      ///Select Floor
      if (floors.contains(label)) {
        final hasFloors = playMap.hasFloor.values();
        switch (label) {
          case "1":
            if (hasFloors.isEmpty) return;
            floor = hasFloors[0];
            break;
          case "2":
            if (hasFloors.length < 2) return;
            floor = hasFloors[1];
            break;
          case "3":
            if (hasFloors.length < 3) return;
            floor = hasFloors[2];
            break;
          case "4":
            if (hasFloors.length < 4) return;
            floor = hasFloors[3];
            break;
          case "5":
            if (hasFloors.length < 5) return;
            floor = hasFloors[4];
            break;
        }
        setState(() {});
        return;
      }
    }

    ///Command Key
    switch (label) {
      //Undo, Redo
      case "Z":
        if (event.isControlPressed) {
          if (event.isShiftPressed) {
            redoSketch();
          } else {
            undoSketch();
          }
        }
        break;
      //Selected MoveIcon Delete
      case "Delete":
      case "D":
        if (label == "D") if (!event.isControlPressed) return;
        if (getSelectMoveIcon() == null) return;
        removeMoveIcon(getSelectMoveIcon()!);
        break;
      //Clone MoveIcon
      case "C":
        if (!event.isControlPressed) return;
        final moveIcon = getSelectMoveIcon();
        if (moveIcon == null) return;
        moveIcon.clone();
        break;
      //Move Map Image
      case "Arrow Right":
        if (!event.isControlPressed) return;
        addPlayMapOffsetX(100);
        break;
      case "Arrow Left":
        if (!event.isControlPressed) return;
        addPlayMapOffsetX(-100);
        break;
      case "Arrow Up":
        if (!event.isControlPressed) return;
        addPlayMapOffsetY(-100);
        break;
      case "Arrow Down":
        if (!event.isControlPressed) return;
        addPlayMapOffsetY(100);
        break;
      //Esc
      case "Escape":
        setSelectMoveIcon(null);
        Navigator.pop(context);
        break;
    }
    setState(() {});
    return;
  }

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
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          _keyEvent(event);
        },
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MoveIconButtonPanel(this).widget(),
            Center(child: SizedBox(width: mapWidth, height: mapHeight, child: ClipRect(child: Stack(children: _displayList())))),
            SketchButtonPanel(this).widget(),
          ],
        )),
      ),

      ///Drawer
      drawer: _loadOpDrawer(),
      endDrawer: PlayMapDrawer(this).getDrawer(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
    );
  }
}
