String generateItemsStatic(Map json) {
  var rows = json['Rows'];
  var buffer = StringBuffer();
  buffer.writeln('// --- GENERATED FILE, DO NOT EDIT ---');
  buffer.writeln(
      'import \'package:icarus_editor_core/icarus_editor_core.dart\';');
  buffer.writeln('');
  buffer.writeln('');
  buffer.writeln('const itemsStatic = {');

  for (Map row in rows) {
    var name = row['Name'];
    var item =
        row.containsKey('Itemable') ? '"${row['Itemable']['RowName']}"' : null;
    var durable =
        row.containsKey('Durable') ? '"${row['Durable']['RowName']}"' : null;

    buffer.writeln('    "$name": ItemStaticEntry("$name", $item, $durable),');
  }

  buffer.writeln('};');
  return buffer.toString();
}
