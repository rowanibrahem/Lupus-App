import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step3_view.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';

class Country {
  final String name;
  final String flag; // emoji or image asset

  Country({required this.name, required this.flag});
}

class PatientSignupStep2View extends StatefulWidget {
  const PatientSignupStep2View({super.key});

  @override
  State<PatientSignupStep2View> createState() => _PatientSignupStep2ViewState();
}

class _PatientSignupStep2ViewState extends State<PatientSignupStep2View> {
  //!------------------------------------------------------------------------
  final List<String> doses = [
    '250 Mg',
    '500 Mg',
    '750 Mg',
    '1000 Mg',
  ];

  String? selectedDose = "500 Mg";
  final List<String> frequencyOptions = [
    "مرة واحدة يومياً",
    "مرتان يومياً",
    "3 مرات يومياً",
    "4 مرات يومياً",
    "عند اللزوم",
  ];

  String? selectedFrequency = "3 مرات يومياً";

  final List<String> lupusTypes = [
    "الذئبة الحمامية المجموعية (SLE)",
    "الذئبة الحمامية الجلدية",
    "الذئبة الناتجة عن الأدوية",
    "الذئبة الوليدية",
  ];

  String? selectedLupusType = "الذئبة الوليدية";
  //!------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/icons/arrow_left.svg"),
            )),
      ),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false, // Allows the content to determine size
                  child: Column(
                    children: [
                      // --- Top Section: Inputs ---
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 18,
                        children: [
                          Center(
                            child: Text(
                              "إنشاء حساب (مريض)",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          LabelTextFormField(
                            label: "الأدوية الحالية",
                            hintText: "أكتب ادويتك",
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Expanded(
                                child: LabelDropdownMenu<String>(
                                  label: "الجرعة",
                                  initialSelection: selectedDose,
                                  onSelected: (value) => setState(() => selectedDose = value),
                                  dropdownMenuEntries: doses.map((dose) => DropdownMenuEntry(value: dose, label: dose)).toList(),
                                ),
                              ),
                              Expanded(
                                child: LabelDropdownMenu<String>(
                                  label: "عدد المرات",
                                  initialSelection: selectedFrequency,
                                  onSelected: (value) => setState(() => selectedFrequency = value),
                                  dropdownMenuEntries: frequencyOptions.map((freq) => DropdownMenuEntry(value: freq, label: freq)).toList(),
                                ),
                              ),
                            ],
                          ),
                          LabelTextFormField(
                            label: "تاريخ التشخيص",
                            hintText: "****/**/**",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset("assets/icons/calendar.svg"),
                            ),
                          ),
                          LabelDropdownMenu<String>(
                            label: "نوع الذئبة الحمراء",
                            width: MediaQuery.of(context).size.width - 32, // Ensures it takes full width
                            initialSelection: selectedLupusType,
                            onSelected: (value) => setState(() => selectedLupusType = value),
                            dropdownMenuEntries: lupusTypes.map((type) => DropdownMenuEntry(value: type, label: type)).toList(),
                          ),
                        ],
                      ),

                      // --- Flexible Space ---
                      const Spacer(flex: 2),
                      const SizedBox(height: 24),

                      // --- Bottom Section: Buttons & Progress ---
                      Column(
                        spacing: 12,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  // Progress bar stacks
                                  Stack(
                                    children: [
                                      Container(
                                        height: 8,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.primaryColor.withOpacity(0.2),
                                        ),
                                      ),
                                      Container(
                                        height: 8,
                                        width: 80, // Set width for full progress on step 2
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "2 من 2 صفحة",
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x3D000000),
                                      offset: const Offset(0, 2),
                                      blurRadius: 7,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PatientSignupStep3View(),
                                      ),
                                    );
                                  },
                                  child: const Text("تأكيد"),
                                ),
                              ),
                            ],
                          ),
                          const Text("عندك حساب بالفعل؟ سجّل دخول"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
