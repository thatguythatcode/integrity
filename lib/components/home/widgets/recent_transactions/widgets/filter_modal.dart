import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showFilterModal({
  required BuildContext context,
  required DateTime initialDate,
  required void Function(DateTime) onDateChanged,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      DateTime selectedDate = initialDate;

      return SizedBox(
        height: 250,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    onDateChanged(selectedDate);
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate,
                onDateTimeChanged: (DateTime date) {
                  selectedDate = date;
                },
                minimumYear: 2000,
                maximumYear: DateTime.now().year,
              ),
            ),
          ],
        ),
      );
    },
  );
}
