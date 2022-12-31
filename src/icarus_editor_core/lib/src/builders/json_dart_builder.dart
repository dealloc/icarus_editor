import 'dart:async';
import 'dart:convert' as convert;
import 'package:build/build.dart';
import 'package:icarus_editor_core/src/builders/durable.dart';
import 'package:icarus_editor_core/src/builders/itemable.dart';
import 'package:icarus_editor_core/src/builders/items_static.dart';

Builder getIcarusEditorGenerator(BuilderOptions options) => JsonDartBuilder();

class JsonDartBuilder extends Builder {
  @override
  Future build(BuildStep buildStep) async {
    var path = buildStep.inputId.path;
    var copy = buildStep.inputId.changeExtension('.g.dart');
    var json = await buildStep.readAsString(buildStep.inputId);
    var map = convert.json.decode(json);

    if (path.endsWith('D_ItemsStatic.json')) {
      await buildStep.writeAsString(copy, generateItemsStatic(map));
    } else if (path.endsWith('D_Itemable.json')) {
      await buildStep.writeAsString(copy, generateItemable(map));
    } else if (path.endsWith('D_Durable.json')) {
      await buildStep.writeAsString(copy, generateDurable(map));
    } else {
      print('Unrecognized JSON input $path');
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.json': ['.g.dart']
      };
}
