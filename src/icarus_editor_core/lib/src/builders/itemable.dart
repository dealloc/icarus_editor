String generateItemable(Map json) {
  var rows = json['Rows'];
  var buffer = StringBuffer();
  buffer.writeln('// --- GENERATED FILE, DO NOT EDIT ---');
  buffer.writeln('');
  buffer.writeln('const itemables = {');

  for (Map row in rows) {
    var name = row['Name'];
    var test = {'test': 'test'};
    var displayName = _extractDisplayName(row['DisplayName']);

    buffer.writeln('    "$name": "$displayName",');
  }

  buffer.writeln('};');
  return buffer.toString();
}

String _extractDisplayName(String raw) {
  if (raw.startsWith('NSLOCTEXT')) {
    String description = raw.split(',')[2];

    return description.substring(2, description.length - 2);
  } else if (raw.startsWith('INVTEXT')) {
    var offset = 'INVTEXT("'.length;
    var length = raw.length - offset - 2;
    return raw.substring(offset, length);
  }

  return raw;
}
