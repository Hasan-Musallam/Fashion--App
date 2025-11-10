import 'package:flutter/material.dart';
class AddressForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;
  final TextEditingController phoneController;

  const AddressForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.zipController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // First Name + Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: inputBorder,
                    labelText: 'First name',
                    border: inputBorder,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: inputBorder,
                    labelText: 'Last name',
                    border: inputBorder,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: addressController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              enabledBorder: inputBorder,
              labelText: 'Address',
              border: inputBorder,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: cityController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              enabledBorder: inputBorder,
              labelText: 'City',
              border: inputBorder,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: stateController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: inputBorder,
                    labelText: 'State',
                    border: inputBorder,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: zipController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: inputBorder,
                    labelText: 'ZIP code',
                    border: inputBorder,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              enabledBorder: inputBorder,
              labelText: 'Phone number',
              border: inputBorder,
            ),
          ),
        ],
      ),
    );
  }
}
