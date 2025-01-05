import 'package:flutter/material.dart';
import 'package:sonmit/components/text_field.dart';

class DateTimePicker extends StatefulWidget {
  final Function(DateTime) onDateTimeSelected;

  const DateTimePicker({Key? key, required this.onDateTimeSelected})
      : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? _selectedDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) return; // User canceled the date picker.

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
    );

    if (selectedTime == null) return; // User canceled the time picker.

    setState(() {
      _selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
    });

    widget.onDateTimeSelected(_selectedDateTime!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDateTime(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDateTime != null
                  ? "${_selectedDateTime!.toLocal()}".split('.')[0]
                  : "Due date",
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';




// import 'package:flutter/material.dart';

class DurationPicker extends StatefulWidget {
  final Function(Duration) onDurationSelected;

  const DurationPicker({Key? key, required this.onDurationSelected})
      : super(key: key);

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController secondController = TextEditingController();


  /// Updates the duration and triggers the callback whenever any value changes.
  void _updateDuration() {
    widget.onDurationSelected(
      Duration(hours: 0, minutes: 0, seconds: 0),
    );
  }

  /// Builds a dropdown for selecting time units (hours, minutes, seconds).
  Widget _buildDropdown(String label, int value, int maxValue, Function(int) onChanged) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        DropdownButton<int>(
          value: value,
          items: List.generate(maxValue + 1, (index) => index)
              .map((unit) => DropdownMenuItem<int>(
                    value: unit,
                    child: Text('$unit'),
                  ))
              .toList(),
          onChanged: (newValue) {
            setState(() {
              onChanged(newValue!);
              _updateDuration(); // Trigger the callback whenever a change occurs.
            });
          },
        ),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Duration", style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormTextField(controller: hourController, hintText: "HR"),
              FormTextField(controller: minuteController, hintText: "MM"),
              FormTextField(controller: secondController, hintText: "SS"),
              // _buildDropdown("MM", _minutes, 59, (value) => _minutes = value),
              // _buildDropdown("SS", _seconds, 59, (value) => _seconds = value),
            ],
          ),
        ],
      ),
    );
  }
}
