import 'package:eventra/features/admin/home/model/event_model.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEventsScreen extends StatefulWidget {
  const AdminEventsScreen({super.key});

  @override
  State<AdminEventsScreen> createState() => _AdminEventsScreenState();
}

class _AdminEventsScreenState extends State<AdminEventsScreen> {
  final List<EventModel> _events = [];
  int? _editingIndex;
  bool isInEmbassy = true;

  // Controllers
  late TextEditingController _titleController;

  late TextEditingController _descriptionController;

  late TextEditingController _locationNameController;

  late TextEditingController _locationAddressController;
  late TextEditingController _locationURLController;

  late TextEditingController _dateController;

  DateTime? _selectedDate;
  String? _selectedCategory;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _locationNameController = TextEditingController();
    _locationAddressController = TextEditingController();
    _locationURLController = TextEditingController();
    _dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationNameController.dispose();
    _locationNameController.dispose();
    _locationNameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _showEventBottomSheet({int? index}) {
    if (index != null) {
      final event = _events[index];
      _titleController.text = event.title;
      _descriptionController.text = event.description;
      _locationNameController.text = event.locationLink;
      _selectedCategory = event.category;
      _selectedDate = event.date;
      _dateController.text = _formatDate(event.date);
      _editingIndex = index;
    }
    bool validateForm() {
      return _titleController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _locationNameController.text.isNotEmpty &&
          _selectedCategory != null &&
          _selectedDate != null;
    }

    void clearForm() {
      _titleController.clear();
      _descriptionController.clear();
      _locationNameController.clear();
      _locationAddressController.clear();
      _locationURLController.clear();
      _dateController.clear();
      _selectedDate = null;
      _selectedCategory = null;
    }

    void saveEvent() {
      final newEvent = EventModel(
        title: _titleController.text,
        description: _descriptionController.text,
        date: _selectedDate!,
        category: _selectedCategory!,
        locationLink: isInEmbassy
            ? "Embassy Event"
            : "${_locationNameController.text}, ${_locationAddressController.text}, ${_locationURLController.text}",
      );

      setState(() {
        if (_editingIndex != null) {
          _events[_editingIndex!] = newEvent;
          _editingIndex = null;
        } else {
          _events.add(newEvent);
        }
        clearForm();
      });
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => EventBottomSheet(
        titleController: _titleController,
        dateController: _dateController,
        descriptionController: _descriptionController,
        locationNameController: _locationNameController,
        initialSelectedDate: _selectedDate,
        initialCategory: _selectedCategory,
        editingIndex: _editingIndex,
        initialIsInEmbassy: isInEmbassy,
        validateForm: validateForm,
        saveEvent: saveEvent,
        formatDate: _formatDate,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Admin Events',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ),
      body: _events.isEmpty
          ? Center(
              child: Text(
                'No events added yet.',
                style: TextStyle(fontSize: 16.sp),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                // to swipe left and right
                return Dismissible(
                  key: Key('$index-${event.title}'),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.w),
                    child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Center(
                            child: Text(
                          'Confirm Delete',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )),
                        content: Text(
                          'Are you sure you want to delete this event?',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 14.sp),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text(
                              'Delete',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    setState(() {
                      _events.removeAt(index);
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: ListTile(
                      title: Text(
                        event.title,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${event.category} - ${_formatDate(event.date)}',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, size: 20.sp),
                        onPressed: () => _showEventBottomSheet(index: index),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEventBottomSheet(),
        child: Icon(Icons.add, size: 25.sp),
      ),
    );
  }
}
