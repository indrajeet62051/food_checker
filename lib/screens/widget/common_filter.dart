import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/text.dart';
import '../../../../../../core/Constrants/color.dart';

Future<void> CommonFilterModal({required BuildContext context}) async {
  List<String> employee = ['Nikhil', 'Jain', 'Rahul'];
  String? selectedValue;
  DateTime? selectedDate;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.7,
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setState) {
              Future<void> _pickDate() async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              }

              return Container(
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, color: black),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Center(
                            child: commonText(
                              text: 'Filter',
                              txtSize: 18,
                              color: black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Staff Dropdown
                    commonText(
                      text: 'Staff Member',
                      txtSize: 14,
                      color: black,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedValue,
                      isExpanded: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: litegray,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: commonText(
                        text: '_ _ Select _ _',
                        txtSize: 14,
                        color: graycol,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down, color: green),
                      items: employee.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // Date Picker
                    commonText(
                      text: 'Date',
                      txtSize: 14,
                      color: black,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onTap: _pickDate,
                      readOnly: true,
                      controller: TextEditingController(
                        text: selectedDate == null
                            ? ''
                            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: litegray,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '_ _ Select _ _',
                        hintStyle: const TextStyle(color: graycol, fontSize: 14),
                        suffixIcon: Container(
                          height: 18,
                          width: 18,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              Assets.iconsCalanderIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                selectedValue = null;
                                selectedDate = null;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: green, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: commonText(
                              text: 'Clear',
                              txtSize: 16,
                              color: green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Apply logic need
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                            ),
                            child: commonText(
                              text: 'Apply',
                              txtSize: 16,
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),   // Apply button
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}

// Example usage screen
class FilterModalExample extends StatelessWidget {
  const FilterModalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Modal Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => CommonFilterModal(context: context),
          child: const Text('Open Filter Modal'),
        ),
      ),
    );
  }
}
