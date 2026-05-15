import 'package:flutter/material.dart';

class AutocompletespinPage extends StatefulWidget {
  const AutocompletespinPage({super.key});

  @override
  State<AutocompletespinPage> createState() =>
      _AutocompletespinPageState();
}

class _AutocompletespinPageState
    extends State<AutocompletespinPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _universityController =
      TextEditingController();

  final TextEditingController _majorController =
      TextEditingController();

  String? _selectedEducationLevel;
  String? _selectedYear;

  final List<String> _universities = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Airlangga',
    'Universitas Brawijaya',
    'Universitas Diponegoro',
    'Universitas Negeri Jakarta',
    'Universitas Pamulang',
  ];

  final List<String> _majors = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Manajemen',
    'Akuntansi',
    'Psikologi',
    'Hukum',
  ];

  final List<String> _educationLevels = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  final List<String> _years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Form Mahasiswa',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 6,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Informasi Mahasiswa',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Universitas
                  _buildAutocompleteField(
                    label: 'Universitas',
                    controller: _universityController,
                    options: _universities,
                    hint: 'Cari universitas...',
                    icon: Icons.school,
                  ),

                  const SizedBox(height: 20),

                  // Jurusan
                  _buildAutocompleteField(
                    label: 'Jurusan',
                    controller: _majorController,
                    options: _majors,
                    hint: 'Cari jurusan...',
                    icon: Icons.book,
                  ),

                  const SizedBox(height: 20),

                  // Jenjang
                  _buildDropdownField(
                    label: 'Jenjang Pendidikan',
                    value: _selectedEducationLevel,
                    items: _educationLevels,
                    hint: 'Pilih jenjang',
                    icon: Icons.timeline,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducationLevel =
                            value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Tahun
                  _buildDropdownField(
                    label: 'Tahun Masuk',
                    value: _selectedYear,
                    items: _years,
                    hint: 'Pilih tahun',
                    icon: Icons.calendar_today,
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                      });
                    },
                  ),

                  const SizedBox(height: 35),

                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= AUTOCOMPLETE =================

  Widget _buildAutocompleteField({
    required String label,
    required TextEditingController controller,
    required List<String> options,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }

            return options.where(
              (option) => option.toLowerCase().contains(
                    textEditingValue.text
                        .toLowerCase(),
                  ),
            );
          },

          onSelected: (value) {
            controller.text = value;
          },

          fieldViewBuilder: (
            context,
            textEditingController,
            focusNode,
            onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,

              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return '$label wajib diisi';
                }
                return null;
              },

              decoration: InputDecoration(
                hintText: hint,

                prefixIcon: Icon(
                  icon,
                  color: Colors.deepPurple,
                ),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // ================= DROPDOWN =================

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required String hint,
    required IconData icon,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        DropdownButtonFormField<String>(
          value: value,

          hint: Text(hint),

          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.deepPurple,
            ),

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
          ),

          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),

          onChanged: onChanged,

          validator: (value) {
            if (value == null ||
                value.isEmpty) {
              return 'Pilih $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  // ================= BUTTON =================

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(
        onPressed: _submitForm,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),

        child: const Text(
          'Simpan Data',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ================= SUBMIT =================

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,

        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Berhasil',
            ),

            content: const Text(
              'Data berhasil disimpan.',
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _resetForm();
                },

                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // ================= RESET =================

  void _resetForm() {
    setState(() {
      _universityController.clear();
      _majorController.clear();
      _selectedEducationLevel = null;
      _selectedYear = null;
    });
  }

  @override
  void dispose() {
    _universityController.dispose();
    _majorController.dispose();
    super.dispose();
  }
}
