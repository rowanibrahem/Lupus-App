import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step2_view.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_radio_button.dart';

class Country {
  final String name;
  final String flag; // emoji or image asset

  Country({required this.name, required this.flag});
}

// PatientBasicInfoView | PatientMedicalInfoView
class PatientSignupStep1View extends StatefulWidget {
  const PatientSignupStep1View({super.key});

  @override
  State<PatientSignupStep1View> createState() => _PatientSignupStep1ViewState();
}

class _PatientSignupStep1ViewState extends State<PatientSignupStep1View> {
  //!------------------------------------------------------------------------
  final List<Country> countries = [
    Country(name: 'Egypt', flag: '🇪🇬'),
    Country(name: 'Saudi Arabia', flag: '🇸🇦'),
    Country(name: 'UAE', flag: '🇦🇪'),
    Country(name: 'Qatar', flag: '🇶🇦'),
  ];
  String selectedCountry = 'Egypt';
  String selectedGender = "ذكر";
  //!------------------------------------------------------------------------
  final List<String> citiesList = ["القاهرة", "الإسكندرية", "الجيزة", "المنصورة", "أسوان", "الأقصر"];

// The state variable that holds the current choice
// Initializing it with the first item, or leave it null for a hint
  String? selectedCity = "القاهرة";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/lupus_carve_loge.png",
                width: size.width,
                height: size.height * 0.33,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 48),
              Text(
                "إنشاء حساب (مريض)",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 1.0,
                  letterSpacing: 0.0,
                ),
              ),
              SizedBox(height: 16),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      //!Todo: Download icons
                      LabelTextFormField(
                        label: "الأسم",
                        hintText: "أدخل الأسم",
                        /* controller: ,
                        validator: ,
                        keyboardType: ,
                        obscureText: ,
                        suffixIcon: ,
                        onChanged: ,*/
                      ),
                      LabelTextFormField(
                        label: "رقم الهاتف",
                        hintText: "أدخل رقم الهاتف",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/icons/smart-phone-01.svg"),
                        ),
                        /* controller: ,
                        validator: ,
                        keyboardType: ,
                        onChanged: ,*/
                      ),
                      LabelTextFormField(
                        label: "البريد الألكتروني",
                        hintText: "أدخل البريد الألكتروني",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/icons/email.svg"),
                        ),

                        /* controller: ,
                        validator: ,
                        keyboardType: ,
                        obscureText: ,
                        suffixIcon: ,
                        onChanged: ,*/
                      ),
                      LabelTextFormField(
                        label: "كلمة المرور",
                        hintText: "أدخل كلمة المرور",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/icons/lock.svg"),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/icons/eye.svg"),
                        ),

                        /* controller: ,
                        validator: ,
                        keyboardType: ,
                        obscureText: ,
                        suffixIcon: ,
                        onChanged: ,*/
                      ),
                      LabelTextFormField(
                        label: "تاريخ الميلاد",
                        hintText: "****/**/**",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/icons/calendar.svg"),
                        ),

                        /* controller: ,
                        validator: ,
                        keyboardType: ,
                        obscureText: ,
                        suffixIcon: ,
                        onChanged: ,*/
                      ),
                      Row(
                        spacing: 42,
                        children: [
                          Expanded(
                            //country_state_picker
                            child: LabelDropdownMenu<String>(
                              label: "الدولة",
                              initialSelection: selectedCountry,
                              onSelected: (value) {
                                if (value != null) {
                                  setState(() => selectedCountry = value);
                                }
                              },
                              dropdownMenuEntries: countries.map((country) {
                                return DropdownMenuEntry<String>(
                                  value: country.name,
                                  label: country.name,
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            child: LabelDropdownMenu<String>(
                              label: "المدينة",
                              initialSelection: selectedCity,
                              onSelected: (value) {
                                if (value != null) {
                                  setState(() => selectedCity = value);
                                }
                              },
                              dropdownMenuEntries: citiesList.map((city) {
                                return DropdownMenuEntry<String>(
                                  value: city,
                                  label: city,
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "النوع",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              height: 1.0,
                              letterSpacing: 0.0,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LabelRadioButton<String>(
                                  label: "ذكر",
                                  value: "ذكر",
                                  groupValue: selectedGender,
                                  onChanged: (val) {
                                    if (val != null) setState(() => selectedGender = val);
                                  },
                                ),
                              ),
                              Expanded(
                                child: LabelRadioButton<String>(
                                  label: "أنثى",
                                  value: "أنثى",
                                  groupValue: selectedGender,
                                  onChanged: (val) {
                                    if (val != null) setState(() => selectedGender = val);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.lightGrayColor,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "1 من 2 صفحة",
                                style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  height: 1.0, // line-height: 100%
                                  letterSpacing: 0,
                                ),
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
                                    builder: (context) => PatientSignupStep2View(),
                                  ),
                                );
                              },
                              child: Text("متابعه"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
