class DataItem {
  int id;               // معرف فريد للعنصر
  String name;          // اسم العنصر
  String description;   // وصف العنصر
  DateTime createdAt;   // تاريخ الإنشاء

  // المنشئ (Constructor)
  DataItem({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  // تحويل البيانات إلى Map (اختياري للمستقبل)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // إنشاء كائن من Map (اختياري للمستقبل)
  factory DataItem.fromMap(Map<String, dynamic> map) {
    return DataItem(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}