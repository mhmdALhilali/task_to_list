// import 'package:flutter/material.dart';
// import '../models/data_item.dart';
// import 'login_screen.dart';

// class DataScreen extends StatefulWidget {
//   @override
//   _DataScreenState createState() => _DataScreenState();
// }

// class _DataScreenState extends State<DataScreen> {
//   // قائمة البيانات
//   List<DataItem> _dataList = [];
//   int _nextId = 1;

//   // متحكمات النصوص
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _addSampleData(); // إضافة بيانات تجريبية
//   }

//   // إضافة بيانات تجريبية
//   void _addSampleData() {
//     _dataList.addAll([
//       DataItem(
//         id: _nextId++,
//         name: 'مهمة العمل الأولى',
//         description: 'إنجاز التقرير الشهري والمراجعة مع الفريق',
//         createdAt: DateTime.now().subtract(Duration(days: 2)),
//       ),
//       DataItem(
//         id: _nextId++,
//         name: 'اجتماع العملاء',
//         description: 'مناقشة متطلبات المشروع الجديد مع العميل',
//         createdAt: DateTime.now().subtract(Duration(days: 1)),
//       ),
//       DataItem(
//         id: _nextId++,
//         name: 'تطوير التطبيق',
//         description: 'البدء في تطوير الواجهات الجديدة للتطبيق',
//         createdAt: DateTime.now(),
//       ),
//     ]);
//   }

//   // إضافة عنصر جديد
//   void _addItem() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _dataList.add(DataItem(
//           id: _nextId++,
//           name: _nameController.text.trim(),
//           description: _descriptionController.text.trim(),
//           createdAt: DateTime.now(),
//         ));
//       });

//       _clearControllers();
//       Navigator.of(context).pop();
//       _showSuccessMessage('تم إضافة العنصر بنجاح');
//     }
//   }

//   // تعديل عنصر موجود
//   void _editItem(DataItem item) {
//     _nameController.text = item.name;
//     _descriptionController.text = item.description;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Row(
//           children: [
//             Icon(Icons.edit, color: Colors.blue),
//             SizedBox(width: 10),
//             Text('تعديل العنصر'),
//           ],
//         ),
//         content: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'الاسم',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.title),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال الاسم';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   labelText: 'الوصف',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.description),
//                 ),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال الوصف';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _clearControllers();
//             },
//             child: Text('إلغاء'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 setState(() {
//                   item.name = _nameController.text.trim();
//                   item.description = _descriptionController.text.trim();
//                 });
//                 _clearControllers();
//                 Navigator.of(context).pop();
//                 _showSuccessMessage('تم تعديل العنصر بنجاح');
//               }
//             },
//             child: Text('حفظ'),
//           ),
//         ],
//       ),
//     );
//   }

//   // حذف عنصر
//   void _deleteItem(DataItem item) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Row(
//           children: [
//             Icon(Icons.warning, color: Colors.red),
//             SizedBox(width: 10),
//             Text('تأكيد الحذف'),
//           ],
//         ),
//         content: Text('هل أنت متأكد من حذف "${item.name}"؟\nلا يمكن التراجع عن هذا الإجراء.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('إلغاء'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _dataList.remove(item);
//               });
//               Navigator.of(context).pop();
//               _showErrorMessage('تم حذف العنصر');
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             child: Text('حذف', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   // إظهار نافذة إضافة عنصر جديد
//   void _showAddDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Row(
//           children: [
//             Icon(Icons.add, color: Colors.green),
//             SizedBox(width: 10),
//             Text('إضافة عنصر جديد'),
//           ],
//         ),
//         content: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'الاسم',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.title),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال الاسم';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   labelText: 'الوصف',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.description),
//                 ),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'يرجى إدخال الوصف';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _clearControllers();
//             },
//             child: Text('إلغاء'),
//           ),
//           ElevatedButton(
//             onPressed: _addItem,
//             child: Text('إضافة'),
//           ),
//         ],
//       ),
//     );
//   }

//   // تسجيل الخروج
//   void _logout() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('تسجيل الخروج'),
//         content: Text('هل تريد تسجيل الخروج من التطبيق؟'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('إلغاء'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//             child: Text('تسجيل الخروج'),
//           ),
//         ],
//       ),
//     );
//   }

//   // تنظيف حقول النص
//   void _clearControllers() {
//     _nameController.clear();
//     _descriptionController.clear();
//   }

//   // رسائل النجاح
//   void _showSuccessMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   // رسائل الخطأ
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   // تنسيق التاريخ
//   String _formatDate(DateTime date) {
//     return '${date.day}/${date.month}/${date.year}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('إدارة البيانات (${_dataList.length} عنصر)'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: _logout,
//             tooltip: 'تسجيل الخروج',
//           ),
//         ],
//       ),
//       body: _dataList.isEmpty
//           ? _buildEmptyState()
//           : _buildDataList(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDialog,
//         backgroundColor: Colors.blue,
//         child: Icon(Icons.add, color: Colors.white),
//         tooltip: 'إضافة عنصر جديد',
//       ),
//     );
//   }

//   // واجهة عدم وجود بيانات
//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.inbox,
//             size: 100,
//             color: Colors.grey[400],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'لا توجد بيانات',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'اضغط على زر + لإضافة عنصر جديد',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // قائمة البيانات
//   Widget _buildDataList() {
//     return ListView.builder(
//       padding: EdgeInsets.all(10),
//       itemCount: _dataList.length,
//       itemBuilder: (context, index) {
//         final item = _dataList[index];
//         return Card(
//           elevation: 3,
//           margin: EdgeInsets.symmetric(vertical: 5),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Text(
//                 '${item.id}',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             title: Text(
//               item.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 5),
//                 Text(
//                   item.description,
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       size: 16,
//                       color: Colors.grey[600],
//                     ),
//                     SizedBox(width: 5),
//                     Text(
//                       'تاريخ الإنشاء: ${_formatDate(item.createdAt)}',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             trailing: PopupMenuButton<String>(
//               onSelected: (value) {
//                 if (value == 'edit') {
//                   _editItem(item);
//                 } else if (value == 'delete') {
//                   _deleteItem(item);
//                 }
//               },
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                   value: 'edit',
//                   child: Row(
//                     children: [
//                       Icon(Icons.edit, color: Colors.blue),
//                       SizedBox(width: 8),
//                       Text('تعديل'),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'delete',
//                   child: Row(
//                     children: [
//                       Icon(Icons.delete, color: Colors.red),
//                       SizedBox(width: 8),
//                       Text('حذف'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import '../models/data_item.dart';
import 'login_screen.dart';

class DataScreen extends StatefulWidget {
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<DataItem> _dataList = [];
  int _nextId = 1;
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _desc = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dataList = [
      DataItem(
        id: _nextId++,
        name: 'مهمة العمل الأولى',
        description: 'تقرير شهري',
        createdAt: DateTime.now().subtract(Duration(days: 2)),
      ),
      DataItem(
        id: _nextId++,
        name: 'اجتماع العملاء',
        description: 'مناقشة المتطلبات',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DataItem(
        id: _nextId++,
        name: 'تطوير التطبيق',
        description: 'بناء الواجهات الجديدة',
        createdAt: DateTime.now(),
      ),
    ];
  }

  void _saveItem({DataItem? item}) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (item == null) {
          _dataList.add(
            DataItem(
              id: _nextId++,
              name: _name.text,
              description: _desc.text,
              createdAt: DateTime.now(),
            ),
          );
          _showMessage('تمت الإضافة', Colors.green);
        } else {
          item.name = _name.text;
          item.description = _desc.text;
          _showMessage('تم التعديل', Colors.green);
        }
      });
      _clear();
      Navigator.pop(context);
    }
  }

  void _showForm({DataItem? item}) {
    if (item != null) {
      _name.text = item.name;
      _desc.text = item.description;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item == null ? 'إضافة عنصر' : 'تعديل عنصر'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _field(_name, 'الاسم', Icons.title),
              SizedBox(height: 10),
              _field(_desc, 'الوصف', Icons.description, max: 3),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _clear();
              Navigator.pop(context);
            },
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => _saveItem(item: item),
            child: Text(item == null ? 'إضافة' : 'حفظ'),
          ),
        ],
      ),
    );
  }

  void _deleteItem(DataItem item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('تأكيد الحذف'),
        content: Text('هل تريد حذف "${item.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() => _dataList.remove(item));
              Navigator.pop(context);
              _showMessage('تم الحذف', Colors.red);
            },
            child: Text('حذف'),
          ),
        ],
      ),
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  void _clear() {
    _name.clear();
    _desc.clear();
  }

  void _showMessage(String msg, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: color));
  }

  String _date(DateTime d) => "${d.day}/${d.month}/${d.year}";

  Widget _field(
    TextEditingController c,
    String label,
    IconData icon, {
    int max = 1,
  }) {
    return TextFormField(
      controller: c,
      maxLines: max,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      validator: (v) => v!.isEmpty ? 'يرجى إدخال $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة البيانات (${_dataList.length})'),
        actions: [IconButton(onPressed: _logout, icon: Icon(Icons.logout))],
      ),
      body: _dataList.isEmpty
          ? Center(child: Text('لا توجد بيانات، اضغط + للإضافة'))
          : ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (_, i) {
                final item = _dataList[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${item.id}")),
                    title: Text(item.name),
                    subtitle: Text(
                      "${item.description}\nتاريخ: ${_date(item.createdAt)}",
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (v) => v == 'edit'
                          ? _showForm(item: item)
                          : _deleteItem(item),
                      itemBuilder: (_) => [
                        PopupMenuItem(value: 'edit', child: Text('تعديل')),
                        PopupMenuItem(value: 'delete', child: Text('حذف')),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _desc.dispose();
    super.dispose();
  }
}
