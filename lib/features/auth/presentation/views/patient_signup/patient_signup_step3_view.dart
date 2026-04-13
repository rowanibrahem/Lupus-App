import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';

class Country {
  final String name;
  final String flag; // emoji or image asset

  Country({required this.name, required this.flag});
}

class PatientSignupStep3View extends StatefulWidget {
  const PatientSignupStep3View({super.key});

  @override
  State<PatientSignupStep3View> createState() => _PatientSignupStep3ViewState();
}

class _PatientSignupStep3ViewState extends State<PatientSignupStep3View> {
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
                              "استكمال البيانات",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          LabelTextFormField(
                            label: "أعراض بتعاني منها ",
                            hintText: "",
                          ),
                          LabelTextFormField(
                            label: "أمراض إضافية بتعاني منها",
                            hintText: "",
                          ),
                          LabelTextFormField(
                            label: "هل عندك حساسية من أدوية معينة؟",
                            hintText: "",
                          ),
                          LabelTextFormField(
                            label: "هل عندك احتياجات خاصة لازم نعرفها؟",
                            hintText: "",
                          ),
                          LabelTextFormField(
                            label: "هل ممكن ترفق تحاليلك؟",
                            hintText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset("assets/icons/copy_link.svg"),
                            ),
                          ),
                        ],
                      ),

                      // --- Flexible Space ---
                      const Spacer(flex: 2),
                      const SizedBox(height: 24),

                      Container(
                        width: size.width,
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
                          onPressed: () {},
                          child: const Text("تأكيد"),
                        ),
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
