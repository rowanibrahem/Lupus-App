abstract class AppConstants {
  static List<Country> countries = [
    Country(name: 'مصر', code: 'eg'),
    Country(name: 'السعودية', code: 'sa'),
    Country(name: 'الإمارات', code: 'ae'),
    Country(name: 'قطر', code: 'qa'),
    Country(name: 'الكويت', code: 'kw'),
    Country(name: 'البحرين', code: 'bh'),
    Country(name: 'عمان', code: 'om'),
    Country(name: 'الأردن', code: 'jo'),
    Country(name: 'فلسطين', code: 'ps'),
    Country(name: 'العراق', code: 'iq'),
    Country(name: 'سوريا', code: 'sy'),
    Country(name: 'لبنان', code: 'lb'),
    Country(name: 'ليبيا', code: 'ly'),
    Country(name: 'تونس', code: 'tn'),
    Country(name: 'الجزائر', code: 'dz'),
    Country(name: 'المغرب', code: 'ma'),
    Country(name: 'السودان', code: 'sd'),
    Country(name: 'اليمن', code: 'ye'),
  ];
  static const Map<String, String> _countryCodes = {
    'مصر': 'eg',
    'السعودية': 'sa',
    'الإمارات': 'ae',
    'قطر': 'qa',
    'الكويت': 'kw',
    'البحرين': 'bh',
    'عُمان': 'om',
    'الأردن': 'jo',
    'فلسطين': 'ps',
    'العراق': 'iq',
    'سوريا': 'sy',
    'لبنان': 'lb',
    'ليبيا': 'ly',
    'تونس': 'tn',
    'الجزائر': 'dz',
    'المغرب': 'ma',
    'السودان': 'sd',
    'اليمن': 'ye',
  };

  static String getCountryCode(String name) {
    return _countryCodes[name] ?? 'eg';
  }

  static const List<String> citiesList = [
    "القاهرة",
    "الإسكندرية",
    "الجيزة",
    "المنصورة",
    "أسوان",
    "الأقصر",
  ];

  static const List<String> lupusTypes = [
    "الذئبة الحمامية المجموعية (SLE)",
    "الذئبة الحمامية الجلدية",
    "الذئبة الناتجة عن الأدوية",
    "الذئبة الوليدية",
  ];
  static const List<String> frequencyOptions = [
    "مرة واحدة يومياً",
    "مرتان يومياً",
    "3 مرات يومياً",
    "4 مرات يومياً",
    "عند اللزوم",
  ];
  static const List<String> doses = [
    '250 Mg',
    '500 Mg',
    '750 Mg',
    '1000 Mg',
  ];

  static const List<String> fieldsOfWork = [
    'الدعم النفسي',
    'الطب والرعاية الصحية',
    'التعليم والتدريس',
    'تكنولوجيا المعلومات',
    'الهندسة',
    'المحاسبة والمالية',
    'التسويق والمبيعات',
    'الإعلام والصحافة',
    'القانون',
    'الموارد البشرية',
    'إدارة الأعمال',
    'خدمة العملاء',
    'السياحة والفنادق',
    'التصميم الجرافيكي',
    'البرمجة وتطوير البرمجيات',
    'تحليل البيانات',
    'الأعمال الحرة (Freelancing)',
    'التجارة',
    'الصناعة والإنتاج',
    'النقل والخدمات اللوجستية',
  ];

  static const List<String> kinship = [
    'أخ',
    'أب',
    'أم',
    'ابن',
    'ابنة',
    'أخت',
    'زوج',
    'زوجة',
    'جد',
    'جدة',
    'عم',
    'عمة',
    'خال',
    'خالة',
    'ابن عم',
    'ابنة عم',
    'ابن خال',
    'ابنة خال',
    'قريب آخر',
  ];
  static final List<int> ages = List<int>.generate(
    75 - 10 + 1,
    (index) => index + 10,
  );
  static const List<String> specializations = [
    'روماتيزم',
    'باطنة عامة',
    'أمراض القلب',
    'أمراض الصدر',
    'أمراض الجهاز الهضمي',
    'أمراض الكلى',
    'أمراض الأعصاب',
    'أمراض الدم',
    'أمراض المناعة',
    'طب الأطفال',
    'جراحة عامة',
    'جراحة العظام',
    'طب الأسرة',
    'الطب النفسي',
    'الأمراض الجلدية',
    'أمراض النساء والتوليد',
    'المسالك البولية',
    'الأشعة والتصوير الطبي',
    'التخدير والعناية المركزة',
  ];
  static const List<String> academicDegrees = [
    'MBBCh / MBBS',
    'MD (Doctor of Medicine)',
    'MS (Master of Surgery)',
    'MSc (Master of Science)',
    'PhD (Doctor of Philosophy)',
    'Diploma',
    'Fellowship',
    'Board Certified',
    'BSc (Bachelor of Science)',
    'BDS (Dentistry)',
  ];
  static final List<String> experienceYears = List<String>.generate(31, (index) => '${index + 1}');
  static const List<String> availability = ['نعم', 'لا'];
  static const List<String> consultationTypes = ['سؤال سريع (Chat Q&A)', 'استشارة صوتية', 'استشارة فيديو', 'زيارة عيادة'];
  static const List<String> workAvailability = ['مستشفى', 'عيادة خاصة', 'أونلاين', 'كلاهما'];
}

class Country {
  final String name;
  final String code;
  Country({required this.name, required this.code});
}
