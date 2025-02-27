import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/data/models/mission/mission_model.dart';

import 'package:englifyar_teacher/domain/usecases/mission/mission_add.dart';

import 'package:englifyar_teacher/service_locator.dart';
import 'package:flutter/material.dart';

class AddMissionScreen extends StatefulWidget {
  const AddMissionScreen({super.key});

  @override
  State<AddMissionScreen> createState() => _AddMissionScreenState();
}

class _AddMissionScreenState extends State<AddMissionScreen> {
  final _topicController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _questionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _selectedCategory;
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("App-Mission-Category")
          .get();

      List<String> categories =
          data.docs.map((doc) => doc["name"] as String).toList();

      setState(() => _categories = categories);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal mengambil kategori: ${e.toString()}")),
      );
    }
  }

  @override
  void dispose() {
    _topicController.dispose();
    _descriptionController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  Future<void> _saveMission() async {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      setState(() => _isLoading = true);
      final usecase = sl<AddOrRemoveMissionUsecase>();
      final result = await usecase.call(
        params: MissionModel(
            category: _selectedCategory,
            description: _descriptionController.text.trim(),
            question: _questionController.text.trim(),
            topic: _topicController.text.trim()),
      );

      setState(() => _isLoading = false);
      result.fold(
        (failure) => _showSnackBar(
            "Gagal menambahkan misi: ${failure.toString()}",
            isError: true),
        (success) {
          _showSnackBar("Misi berhasil ditambahkan!");
          _topicController.clear();
          _descriptionController.clear();
          _questionController.clear();
          setState(() => _selectedCategory = null);
        },
      );
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Misi")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_topicController, "Topik"),
              const SizedBox(height: 16),
              _buildCategoryDropdown(),
              const SizedBox(height: 16),
              _buildTextField(_descriptionController, "Deskripsi Misi"),
              const SizedBox(height: 16),
              _buildTextField(_questionController, "Pertanyaan"),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isLoading ? null : _saveMission,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Simpan",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? "$label tidak boleh kosong" : null,
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      decoration: InputDecoration(
        labelText: "Kategori",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: _categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => _selectedCategory = value);
      },
      validator: (value) => value == null ? "Kategori harus dipilih" : null,
    );
  }
}
