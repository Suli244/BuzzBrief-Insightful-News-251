class KJDFLadf {
  final String arar1;
  final String fdadf2;
  final String fasfa3;
  final String dfafsd4;
  final bool isPr;
  KJDFLadf({
    required this.arar1,
    required this.fdadf2,
    required this.fasfa3,
    required this.dfafsd4,
    required this.isPr,
  });

  factory KJDFLadf.fromJson(Map<String, dynamic> map) {
    return KJDFLadf(
      arar1: map['arar1'],
      fdadf2: map['fdadf2'],
      fasfa3: map['fasfa3'],
      dfafsd4: map['dfafsd4'],
      isPr: map['isPr'],
    );
  }

  @override
  String toString() {
    return 'KJDFLadf(arar1: $arar1, fdadf2: $fdadf2, fasfa3: $fasfa3, dfafsd4: $dfafsd4, isPr: $isPr)';
  }
}
