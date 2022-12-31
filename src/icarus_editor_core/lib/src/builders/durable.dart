String generateDurable(Map json) {
  var rows = json['Rows'];
  var buffer = StringBuffer();
  buffer.writeln('// --- GENERATED FILE, DO NOT EDIT ---');
  buffer.writeln('');
  buffer.writeln('const durables = {');

  for (Map row in rows) {
    var name = row['Name'];
    var durability = row['Max_Durability'];

    buffer.writeln('    "$name": $durability,');
  }

  buffer.writeln('};');
  return buffer.toString();
}
