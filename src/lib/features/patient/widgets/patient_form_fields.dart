import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor_apps/models/patient.dart';
import 'package:doctor_apps/ui/common/ui_helpers.dart';
import 'package:doctor_apps/utils/const/const.dart';

class PatientFormFields extends StatelessWidget {
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onAgeChanged;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onAddressChanged;  
  final ValueChanged<String> onMedicalHistoryChanged;
  final Patient? initialValues;
  final bool isLoading;

  const PatientFormFields({
    Key? key,
    required this.onNameChanged,
    required this.onAgeChanged, 
    required this.onGenderChanged,
    required this.onPhoneChanged,
    required this.onAddressChanged,
    required this.onMedicalHistoryChanged,
    this.initialValues,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: initialValues?.name,
          decoration: const InputDecoration(
            labelText: kLabelName,
            hintText: 'Enter patient\'s full name',
          ),
          enabled: !isLoading,
          onChanged: onNameChanged,
        ),
        verticalSpaceSmall,
        TextFormField(
          initialValue: initialValues?.age.toString(),
          decoration: const InputDecoration(
            labelText: kLabelAge,
            hintText: 'Enter patient\'s age',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          enabled: !isLoading,
          onChanged: onAgeChanged,
        ),
        verticalSpaceSmall,
        DropdownButtonFormField<String>(
          value: initialValues?.gender,
          decoration: const InputDecoration(
            labelText: kLabelGender,
          ),
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
          onChanged: isLoading ? null : (value) => onGenderChanged(value ?? ''),
        ),
        verticalSpaceSmall,
        TextFormField(
          initialValue: initialValues?.phone,
          decoration: const InputDecoration(
            labelText: kLabelPhone,
            hintText: 'Enter phone number',
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          enabled: !isLoading,
          onChanged: onPhoneChanged,
        ),
        verticalSpaceSmall,
        TextFormField(
          initialValue: initialValues?.address,
          decoration: const InputDecoration(
            labelText: kLabelAddress,
            hintText: 'Enter patient\'s address',
          ),
          maxLines: 2,
          enabled: !isLoading,
          onChanged: onAddressChanged,
        ),
        verticalSpaceSmall,
        TextFormField(
          initialValue: initialValues?.medicalHistory,
          decoration: const InputDecoration(
            labelText: kLabelMedicalHistory,
            hintText: 'Enter patient\'s medical history',
          ),
          maxLines: 4,
          enabled: !isLoading,
          onChanged: onMedicalHistoryChanged,
        ),
      ],
    );
  }
}