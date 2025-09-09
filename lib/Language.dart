// ignore_for_file: file_names

import 'dart:io';

import 'package:utility_yaml/utility_yaml.dart';

class Language {
  Language() {
    const debugPath = 'assets';
    final buildPath = '${Directory.current.path.replaceAll('\\', '/')}/data/flutter_assets/assets';

    if (Directory(debugPath).existsSync()) {
      _assetsPath = debugPath;
    } else {
      _assetsPath = buildPath;
    }

    final config = YamlConfiguration.loadPath('$_assetsPath/config.yml');
    final language = config.getString('language');
    if (language == null) {
      _yaml = YamlConfiguration.loadPath('$_assetsPath/language/english.yml');
    } else {
      _yaml = YamlConfiguration.loadPath('$_assetsPath/language/$language.yml');
    }
    _setMaps();
  }

  late final String _assetsPath;

  late YamlConfiguration _yaml;

  late Map<String, dynamic> _main;
  late Map<String, dynamic> _attackOperator;
  late Map<String, dynamic> _defenceOperator;
  late Map<String, dynamic> _playMap;
  late Map<String, dynamic> _publicGadget;

  changeLanguage(String language) {
    final configFile = File('$_assetsPath/config.yml');
    final config = YamlConfiguration.loadFile(configFile);
    config.saveToFile(configFile);

    final languageFile = File('$_assetsPath/language/$language.yml');

    if (languageFile.existsSync()) {
      _yaml = YamlConfiguration.loadFile(languageFile);
    } else {
      _yaml = YamlConfiguration.loadFile(File('$_assetsPath/language/english.yml'));
    }
    _setMaps();
  }

  _setMaps() {
    _main = _yaml.getMap('main')!;
    _attackOperator = _yaml.getMap('attack_operator')!;
    _defenceOperator = _yaml.getMap('defense_operator')!;
    _playMap = _yaml.getMap('map')!;
    _publicGadget = _yaml.getMap('public_gadget')!;
  }

  String main(String key) {
    return _main[key].toString();
  }

  String attackOperator(String key) {
    return _attackOperator[key].toString();
  }

  String defenceOperator(String key) {
    return _defenceOperator[key].toString();
  }

  String playMap(String key) {
    return _playMap[key].toString();
  }

  String publicGadget(String key) {
    return _publicGadget[key].toString();
  }
}
