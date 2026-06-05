import 'package:flutter/material.dart';

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
  static const Map<String, List<String>> citiesByCountry = {
    'مصر': ['القاهرة', 'الإسكندرية', 'الجيزة', 'المنصورة', 'أسوان', 'الأقصر', 'طنطا', 'الزقازيق'],
    'السعودية': ['الرياض', 'جدة', 'مكة المكرمة', 'المدينة المنورة', 'الدمام', 'الخبر', 'تبوك', 'أبها'],
    'الإمارات': ['أبوظبي', 'دبي', 'الشارقة', 'عجمان', 'رأس الخيمة', 'الفجيرة', 'أم القيوين'],
    'قطر': ['الدوحة', 'الريان', 'الوكرة', 'الخور', 'الشمال', 'الشحانية'],
    'الكويت': ['مدينة الكويت', 'حولي', 'الفروانية', 'الأحمدي', 'الجهراء', 'مبارك الكبير'],
    'البحرين': ['المنامة', 'المحرق', 'الرفاع', 'مدينة عيسى', 'مدينة حمد', 'سترة'],
    'عمان': ['مسقط', 'صلالة', 'نزوى', 'صحار', 'السيب', 'مطرح'],
    'الأردن': ['عمّان', 'الزرقاء', 'إربد', 'العقبة', 'السلط', 'المفرق'],
    'فلسطين': ['القدس', 'غزة', 'رام الله', 'نابلس', 'الخليل', 'جنين', 'طولكرم'],
    'العراق': ['بغداد', 'البصرة', 'الموصل', 'أربيل', 'كركوك', 'النجف', 'كربلاء'],
    'سوريا': ['دمشق', 'حلب', 'حمص', 'حماة', 'اللاذقية', 'دير الزور', 'درعا'],
    'لبنان': ['بيروت', 'طرابلس', 'صيدا', 'صور', 'زحلة', 'جونية'],
    'ليبيا': ['طرابلس', 'بنغازي', 'مصراتة', 'الزاوية', 'البيضاء', 'سبها'],
    'تونس': ['تونس', 'صفاقس', 'سوسة', 'القيروان', 'بنزرت', 'قابس'],
    'الجزائر': ['الجزائر', 'وهران', 'قسنطينة', 'عنابة', 'بلعباس', 'تلمسان'],
    'المغرب': ['الرباط', 'الدار البيضاء', 'فاس', 'مراكش', 'طنجة', 'أكادير', 'مكناس'],
    'السودان': ['الخرطوم', 'أم درمان', 'بورتسودان', 'كسلا', 'الفاشر', 'الأبيض'],
    'اليمن': ['صنعاء', 'عدن', 'تعز', 'الحديدة', 'إب', 'ذمار', 'المكلا'],
  };

// helper
  static List<String> getCitiesForCountry(String? countryName) {
    if (countryName == null) return [];
    return citiesByCountry[countryName] ?? [];
  }

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
  static const List<Map<String, dynamic>> postTypes = [
    {"title": "العامة", "icon": Icons.public},
    {"title": "الأصدقاء", "icon": Icons.group},
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
  static const String psychologicalSupportTitle = 'الدعم النفسي';
  static const String sessionsTitle = "جلسات علاجية";
  static const String friendsTitle = "أصدقاؤك";
  static const String postsTitle = "منشورات";
  static const String discussionsTitle = "نقاشات";
  static const List<String> psychologicalSupportTabs = ["مجتمع", "قصص", "جلسات"];
  static const List<Map<String, String>> friendsNames = [
    {"name": "أمل", "image": "assets/images/chat1.png"},
    {"name": "ساره", "image": "assets/images/chat2.png"},
    {"name": "مريم", "image": "assets/images/chat3.png"},
    {"name": "سلمي", "image": "assets/images/chat4.png"},
    {"name": "أنس", "image": "assets/images/chat5.png"},
    {"name": "هبة", "image": "assets/images/chat6.png"},
  ];

  static const List<Map<String, dynamic>> psychologicalSupportPosts = [
    {
      "accountName": "ساره محمد",
      "accountImage": "assets/images/chat1.png",
      "content": "بقي لي سنة تقريباً من يوم ما اكتشفت إن عندي الكآبة الحادة، وكانت أصعب سنة في حياتي. بس اللي علمتني إياه إن الطريق للتعافي مش خط مستقيم، فيه أيام صعبة وأيام أحسن، والمهم ما تستسلم.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat1.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat2.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat2.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat2.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat2.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat2.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "شهد وائل",
      "accountImage": "assets/images/chat2.png",
      "content": "الدعم النفسي فرق معايا كثير، لما تتكلم مع ناس فاهمين ومرّوا بنفس الشي، تحس إنك مش لحالك في المعركة هذي.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "نورة العتيبي",
      "accountImage": "assets/images/chat3.png",
      "content": "كنت أخاف أعترف إن عندي قلق اجتماعي لأني كنت أحسب الناس بتحكم علي. بس لما شاركت قصتي هنا، اكتشفت إن كثير منكم يمرّون بنفس الشي. شكراً لأنكم خليتوني أحس بالأمان.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "عمر الشمري",
      "accountImage": "assets/images/chat4.png",
      "content": "أصعب خطوة كانت إني أطلب المساعدة. كنت أقول لنفسي 'أنا قادر أتحمل لحالي' إلى أن وصلت لنقطة ما قدرت. اليوم بعد سنتين من الجلسات، أقدر أقول إن طلب المساعدة كان أشجع قرار اتخذته.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "لينا الزهراني",
      "accountImage": "assets/images/chat5.png",
      "content": "الاضطراب ثنائي القطب غيّر حياتي، بس ما وقفني. تعلمت أتعرف على علاماتي المبكرة وأتعامل معها. الدواء والعلاج والدعم من الناس المقربين، هذا الثلاثي هو اللي يمشيني.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "خالد المطيري",
      "accountImage": "assets/images/chat6.png",
      "content": "مريت بفترة كنت فيها ما أقدر أنام، وما أقدر آكل، وما أقدر أركز. الطبيبة قالت لي إنه إرهاق نفسي. اليوم أهم شي تعلمته: الراحة مش كسل، الراحة ضرورة.",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat3.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "ريم السعيد",
      "accountImage": "assets/images/chat2.png",
      "content": "لما فقدت أمي، حسيت إن العالم وقف. الحزن كان أكبر مني. جلسات الدعم النفسي ما محت الألم، بس علمتني كيف أحمله بطريقة أقدر أكمل معها.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "سلطان الدوسري",
      "accountImage": "assets/images/chat1.png",
      "content": "الناس تظن الاكتئاب يعني إنك حزين طول الوقت. عندي كان بالعكس، كنت أحس بفراغ تام وخدر. ما أحس بشي. اللي ساعدني إني فهمت إن هذا مرض وله علاج، مش ضعف في شخصيتي.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "هيا القحطاني",
      "accountImage": "assets/images/chat2.png",
      "content": "بدأت رحلتي مع التعافي من الصدمة بخطوة صغيرة: كتابة يومياتي. كل يوم كتبت شي واحد أنا ممتنة له. بدا الأمر سخيفاً في البداية، لكنه غير طريقة تفكيري شيئاً فشيئاً.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "فيصل العنزي",
      "accountImage": "assets/images/chat3.png",
      "content": "أنا مؤمن إن مجتمعنا بدأ يتغير وبدأ يتقبل موضوع الصحة النفسية أكثر. بس لازم نكمل نتكلم ونشارك قصصنا، عشان اللي لسا خايف يشوف إن مش عيب تطلب المساعدة.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "منال الحربي",
      "accountImage": "assets/images/chat4.png",
      "content": "عشت سنوات أخبّي قلقي خلف ابتسامة. كنت 'الشخص القوي' في العيلة. لما انهرت أخيراً، كان أكبر مفاجأة إن كل الناس اللي حواليّ كانوا مستعدين يدعموني لو بس قلتلهم.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "أحمد الرشيدي",
      "accountImage": "assets/images/chat5.png",
      "content": "التأمل والتنفس العميق ما كنت أصدق إنهم يفيدون، بس لما جربتهم بانتظام مع العلاج، لاحظت فرقاً حقيقياً في مستوى توتري. الجسم والعقل مرتبطين أكثر مما نتخيل.",
      "comments": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png", "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.", "createTime": "منذ ساعتين"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png", "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.", "createTime": "منذ ساعة"},
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
  ];
  static const List<Map<String, dynamic>> psychologicalSupportDiscussions = [
    {
      "accountName": "ساره محمد",
      "accountImage": "assets/images/chat1.png",
      "content": "هل في حد جرب العلاج الإلكتروني وعايز يشاركنا تجربته؟",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat3.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "عمر الشمري",
      "accountImage": "assets/images/chat4.png",
      "content": "كيف تتعاملون مع أيام الانتكاسة لما تحسون إن كل شي راح من جديد؟",
      "comments": [
        {"accountName": "لينا الزهراني", "accountImage": "assets/images/chat5.png", "content": "أول شي أذكّر نفسي إن الانتكاسة مرحلة مؤقتة مش نهاية الطريق، وأرجع لقائمة الأشياء اللي ساعدتني قبل.", "createTime": "منذ 5 ساعات"},
        {"accountName": "منال الحربي", "accountImage": "assets/images/chat4.png", "content": "أتصل بمعالجتي فوراً، تعلمت إن طلب المساعدة في اللحظة الصعبة هو أذكى قرار.", "createTime": "منذ 4 ساعات"},
        {"accountName": "أحمد الرشيدي", "accountImage": "assets/images/chat5.png", "content": "أحاول أمشي نص ساعة بالخارج، الحركة الجسدية تكسر حلقة الأفكار السلبية عندي.", "createTime": "منذ 3 ساعات"},
      ],
      "likes": [
        {"accountName": "لينا الزهراني", "accountImage": "assets/images/chat5.png"},
        {"accountName": "سلطان الدوسري", "accountImage": "assets/images/chat1.png"},
        {"accountName": "هيا القحطاني", "accountImage": "assets/images/chat2.png"},
        {"accountName": "فيصل العنزي", "accountImage": "assets/images/chat3.png"},
      ],
    },
    {
      "accountName": "شهد وائل",
      "accountImage": "assets/images/chat2.png",
      "content": "أي تطبيق أو كتاب غيّر تفكيركم في موضوع الصحة النفسية؟",
      "comments": [
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png", "content": "كتاب 'أنت أقوى مما تعتقد' غيّر نظرتي لنفسي كلياً، أنصح فيه بشدة.", "createTime": "منذ يوم"},
        {"accountName": "فيصل العنزي", "accountImage": "assets/images/chat3.png", "content": "تطبيق Headspace ساعدني أبدأ التأمل بشكل منتظم، الجلسات القصيرة مناسبة للمبتدئين.", "createTime": "منذ 20 ساعة"},
        {"accountName": "هيا القحطاني", "accountImage": "assets/images/chat2.png", "content": "أنصح بكتاب 'قوة الحاضر' لإيكهارت تول، علّمني أعيش اللحظة بدل ما أغرق في الماضي أو المستقبل.", "createTime": "منذ 18 ساعة"},
      ],
      "likes": [
        {"accountName": "ساره محمد", "accountImage": "assets/images/chat1.png"},
        {"accountName": "عمر الشمري", "accountImage": "assets/images/chat4.png"},
        {"accountName": "أحمد الرشيدي", "accountImage": "assets/images/chat5.png"},
      ],
    },
    {
      "accountName": "لينا الزهراني",
      "accountImage": "assets/images/chat5.png",
      "content": "كيف تشرحون لعيلتكم طبيعة الاضطراب اللي عندكم لما ما يفهمون؟",
      "comments": [
        {"accountName": "سلطان الدوسري", "accountImage": "assets/images/chat1.png", "content": "جبت لهم مقاطع يوتيوب قصيرة من متخصصين، أحياناً الكلام من طرف ثالث يوصل أسرع.", "createTime": "منذ يومين"},
        {"accountName": "منال الحربي", "accountImage": "assets/images/chat4.png", "content": "طلبت من معالجتي تعقد جلسة مع أمي تشرح لها، كان أفضل قرار لأن الطبيبة عرفت كيف تكسر المفاهيم الخاطئة.", "createTime": "منذ يومين"},
      ],
      "likes": [
        {"accountName": "شهد وائل", "accountImage": "assets/images/chat2.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "لينا الزهراني", "accountImage": "assets/images/chat5.png"},
      ],
    },
    {
      "accountName": "خالد المطيري",
      "accountImage": "assets/images/chat6.png",
      "content": "هل الرياضة فعلاً ساعدت أحد منكم في تحسين مزاجه؟ وش نوع الرياضة؟",
      "comments": [
        {"accountName": "عمر الشمري", "accountImage": "assets/images/chat4.png", "content": "المشي اليومي نص ساعة حوّل حياتي، بسيطة بس أثرها عميق على مزاجي ونومي.", "createTime": "منذ 6 ساعات"},
        {"accountName": "أحمد الرشيدي", "accountImage": "assets/images/chat5.png", "content": "السباحة خففت توتري بشكل ملحوظ، وكمان اليوغا علّمتني أتحكم في تنفسي وقت القلق.", "createTime": "منذ 5 ساعات"},
        {
          "accountName": "هيا القحطاني",
          "accountImage": "assets/images/chat2.png",
          "content": "رياضة رفع الأثقال غيّرت ثقتي بنفسي، الإحساس بالإنجاز بعد كل تمرين يعدّل هرمونات المزاج فعلاً.",
          "createTime": "منذ 4 ساعات",
        },
      ],
      "likes": [
        {"accountName": "ساره محمد", "accountImage": "assets/images/chat1.png"},
        {"accountName": "لينا الزهراني", "accountImage": "assets/images/chat5.png"},
        {"accountName": "فيصل العنزي", "accountImage": "assets/images/chat3.png"},
      ],
    },
    {
      "accountName": "ريم السعيد",
      "accountImage": "assets/images/chat2.png",
      "content": "كيف تتعاملون مع وصمة العار الاجتماعية حول العلاج النفسي في محيطكم؟",
      "comments": [
        {
          "accountName": "فيصل العنزي",
          "accountImage": "assets/images/chat3.png",
          "content": "بكل بساطة توقفت عن الاهتمام برأي من لا يفهم، صحتي أهم من توقعات الناس.",
          "createTime": "منذ 3 أيام",
        },
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat3.png",
          "content": "أشارك معلومات مبسّطة عن الصحة النفسية في دواوير العيلة، التوعية من الداخل أقوى تأثيراً.",
          "createTime": "منذ 3 أيام",
        },
        {
          "accountName": "سلطان الدوسري",
          "accountImage": "assets/images/chat1.png",
          "content": "ما أخبر إلا من أثق فيه. خصوصيتي خطي الأحمر، والتغيير الإيجابي اللي يشوفونه فيّ هو أفضل رد.",
          "createTime": "منذ يومين",
        },
      ],
      "likes": [
        {"accountName": "منال الحربي", "accountImage": "assets/images/chat4.png"},
        {"accountName": "شهد وائل", "accountImage": "assets/images/chat2.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
      ],
    },
  ];

  static const List<Map<String, dynamic>> psychologicalSupportStories = [
    {
      "accountName": "أمل محمد",
      "accountImage": "assets/images/chat2.png",
      "content": "بقي لي سنة تقريبًا من يوم ما اكتشفت إن عندي الذئبة الحمراء. في الأول كنت تايه..اقرأ المزيد",
      "createTime": "منذ 3 ساعات",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat3.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "ساره احمد",
      "accountImage": "assets/images/chat2.png",
      "content": "الدعم النفسي فرق معايا جدًا، خصوصًا لما بدأت أتكلم مع ناس فاهمين أنا بحس بإيه..اقرأ المزيد",
      "createTime": "منذ يوم",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat7.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "أمل محمد",
      "accountImage": "assets/images/chat2.png",
      "content": "بقي لي سنة تقريبًا من يوم ما اكتشفت إن عندي الذئبة الحمراء. في الأول كنت تايه..اقرأ المزيد",
      "createTime": "منذ 3 ساعات",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat3.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
    {
      "accountName": "ساره احمد",
      "accountImage": "assets/images/chat2.png",
      "content": "الدعم النفسي فرق معايا جدًا، خصوصًا لما بدأت أتكلم مع ناس فاهمين أنا بحس بإيه..اقرأ المزيد",
      "createTime": "منذ يوم",
      "comments": [
        {
          "accountName": "نورة العتيبي",
          "accountImage": "assets/images/chat7.png",
          "content": "جربته وكان تجربة رائعة، الجلسات أونلاين وفّرت عليّ وقت التنقل وحسيت براحة أكثر وأنا في بيتي.",
          "createTime": "منذ ساعتين",
        },
        {
          "accountName": "خالد المطيري",
          "accountImage": "assets/images/chat6.png",
          "content": "في البداية كنت متردد بس بعدين اعتديت عليه، الاتصال بالفيديو خلى الجلسة تحس إنها طبيعية.",
          "createTime": "منذ ساعة",
        },
      ],
      "likes": [
        {"accountName": "نورة العتيبي", "accountImage": "assets/images/chat3.png"},
        {"accountName": "خالد المطيري", "accountImage": "assets/images/chat6.png"},
        {"accountName": "ريم السعيد", "accountImage": "assets/images/chat2.png"},
      ],
    },
  ];
  static const List<Map<String, dynamic>> communities = [
    {
      'name': 'جمعية دعم أمراض المناعة الذاتية',
      'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
      'location': 'القاهرة - مدينة نصر',
      'availableServices': [
        {
          "icon": Icons.volunteer_activism_outlined,
          "label": 'الدعم المادي',
        },
        {
          "icon": Icons.medication_outlined,
          "label": 'أدوية',
        },
        {
          "icon": Icons.psychology_outlined,
          "label": 'دعم نفسي',
        },
      ],
      'contactMethods': [
        {
          "icon": Icons.language,
          "label": 'WWW.Slu.Orndvx.Com',
        },
        {
          "icon": Icons.phone_outlined,
          "label": '01027778899',
        },
        {
          "icon": Icons.email_outlined,
          "label": 'support@slu.org',
        },
      ],
      'financialSupports': [
        {
          'title': 'مطلوب دعم مادي عاجل',
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'amount': '3000ج',
          'remaining': '500ج',
          'progress': '0.7',
          'image': 'assets/images/charity_illustration.png',
        },
        {
          'title': 'مطلوب دعم مادي عاجل',
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'amount': '6000ج',
          'remaining': '3000ج',
          'progress': '0.5',
          'image': 'assets/images/charity_illustration.png',
        },
        {
          'title': 'مطلوب أدوية عاجلة',
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'amount': '1500ج',
          'remaining': '200ج',
          'progress': '0.85',
          'image': 'assets/images/charity_illustration.png',
        },
      ],
      'contributions': [
        {
          'title': 'متبرع فردي يعرض دواء خاص بمرض الذئبة',
          'description': 'متوفر دواء سيليسليت 500',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'متبرع فردي يعرض دواء خاص بمرض الذئبة',
          'description': 'متوفر دواء سيليسليت 500',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'متبرع فردي يعرض دواء خاص بمرض الذئبة',
          'description': 'متوفر دواء سيليسليت 500',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'متبرع فردي يعرض دواء خاص بمرض الذئبة',
          'description': 'متوفر دواء سيليسليت 500',
          'image': 'assets/images/medicine_illustration.png',
        },
      ],
      'medicines': [
        {
          'title': 'حالة دواء مسجّلة',
          'description': 'حالة مسجّلة لدى الجمعية لمريضة ذئبة بحاجة إلى دواء ضروري لاستكمال العلاج',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'فرصة أجر... تبرع بالدم',
          'description': 'مطلوب متبرعين بالدم بشكل عاجل لدعم حالة مرضية.',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'حالة دواء مسجّلة',
          'description': 'حالة مسجّلة لدى الجمعية لمريضة ذئبة بحاجة إلى دواء ضروري لاستكمال العلاج',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'فرصة أجر... تبرع بالدم',
          'description': 'مطلوب متبرعين بالدم بشكل عاجل لدعم حالة مرضية.',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'حالة دواء مسجّلة',
          'description': 'حالة مسجّلة لدى الجمعية لمريضة ذئبة بحاجة إلى دواء ضروري لاستكمال العلاج',
          'image': 'assets/images/medicine_illustration.png',
        },
      ],
    },
    {
      'name': 'جمعية الذئبة الحمراء للدعم',
      'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
      'location': 'القاهرة - مدينة نصر',
      'availableServices': [
        {
          "icon": Icons.medication_outlined,
          "label": 'توفير أدوية',
        },
        {
          "icon": Icons.school_outlined,
          "label": 'ورش توعية',
        },
        {
          "icon": Icons.groups_outlined,
          "label": 'مجموعات دعم',
        },
      ],
      'contactMethods': [
        {
          "icon": Icons.phone_outlined,
          "label": '01112223344',
        },
        {
          "icon": Icons.language,
          "label": 'WWW.LupusSupport.Org',
        },
        {
          "icon": Icons.facebook_outlined,
          "label": 'fb.com/lupus.support',
        },
      ],
      'financialSupports': [
        {
          'title': 'مساعدة لعلاج حالة ذئبة',
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'amount': '5000ج',
          'remaining': '1500ج',
          'progress': '0.7',
          'image': 'assets/images/charity_illustration.png',
        },
        {
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'title': 'دعم جلسات علاج مناعي',
          'amount': '2500ج',
          'remaining': '700ج',
          'progress': '0.72',
          'image': 'assets/images/charity_illustration.png',
        },
      ],
      'contributions': [
        {
          'title': 'متبرع يوفر أدوية مناعة',
          'description': 'متوفر دواء هيدروكسي كلوروكوين بكمية محدودة',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'تبرع لمريضة ذئبة',
          'description': 'توفير أدوات طبية ومستلزمات متابعة شهرية',
          'image': 'assets/images/blood_illustration.png',
        },
      ],
      'medicines': [
        {
          'title': 'حالة بحاجة لدواء عاجل',
          'description': 'مريضة بحاجة إلى علاج مناعي بشكل عاجل لاستكمال الخطة العلاجية',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'فرصة تبرع بالدم',
          'description': 'الحاجة إلى متبرعين بالدم لدعم إحدى الحالات الحرجة',
          'image': 'assets/images/blood_illustration.png',
        },
      ],
    },
    {
      'name': 'مؤسسة أمل لمرضى المناعة',
      'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
      'location': 'الإسكندرية - سموحة',
      'availableServices': [
        {
          "icon": Icons.favorite_outline,
          "label": 'رعاية منزلية',
        },
        {
          "icon": Icons.psychology_outlined,
          "label": 'دعم نفسي',
        },
        {
          "icon": Icons.medical_services_outlined,
          "label": 'تحاليل طبية',
        },
      ],
      'contactMethods': [
        {
          "icon": Icons.phone_outlined,
          "label": '01234567890',
        },
        {
          "icon": Icons.location_on_outlined,
          "label": 'سموحة - الإسكندرية',
        },
        {
          "icon": Icons.email_outlined,
          "label": 'amal.foundation@mail.com',
        },
      ],
      'financialSupports': [
        {
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'title': 'دعم علاج شهري',
          'amount': '4000ج',
          'remaining': '1000ج',
          'progress': '0.75',
          'image': 'assets/images/charity_illustration.png',
        },
        {
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'title': 'مساعدة لشراء تحاليل',
          'amount': '1800ج',
          'remaining': '600ج',
          'progress': '0.66',
          'image': 'assets/images/charity_illustration.png',
        },
      ],
      'contributions': [
        {
          'title': 'متبرع يوفر أجهزة قياس',
          'description': 'توفير أجهزة متابعة ضغط وسكر لبعض الحالات',
          'image': 'assets/images/blood_illustration.png',
        },
        {
          'title': 'مساهمة دوائية',
          'description': 'توفير أدوية مناعة لمدة شهر كامل',
          'image': 'assets/images/medicine_illustration.png',
        },
      ],
      'medicines': [
        {
          'title': 'دواء غير متوفر',
          'description': 'الجمعية تبحث عن متبرعين لتوفير علاج مناعي نادر لحالة حرجة',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'مطلوب متبرعين بالدم',
          'description': 'حالة طارئة تحتاج إلى فصائل دم بشكل عاجل',
          'image': 'assets/images/blood_illustration.png',
        },
      ],
    },
    {
      'name': 'جمعية الرعاية الصحية المتكاملة',
      'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
      'location': 'الجيزة - المهندسين',
      'availableServices': [
        {
          "icon": Icons.local_hospital_outlined,
          "label": 'فحوصات طبية',
        },
        {
          "icon": Icons.support_agent_outlined,
          "label": 'دعم واستشارات',
        },
        {
          "icon": Icons.menu_book_outlined,
          "label": 'مواد تعليمية',
        },
        {
          "icon": Icons.groups_outlined,
          "label": 'مجتمع داعم',
        },
      ],
      'contactMethods': [
        {
          "icon": Icons.phone_outlined,
          "label": '01555557777',
        },
        {
          "icon": Icons.language,
          "label": 'WWW.HealthCare.Org',
        },
        {
          "icon": Icons.email_outlined,
          "label": 'contact@healthcare.org',
        },
      ],
      'financialSupports': [
        {
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'title': 'دعم جلسات علاج',
          'amount': '7000ج',
          'remaining': '2500ج',
          'progress': '0.64',
          'image': 'assets/images/charity_illustration.png',
        },
        {
          "content": "مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.  ساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.",
          'title': 'مساعدة شراء أدوية',
          'amount': '3200ج',
          'remaining': '1200ج',
          'progress': '0.62',
          'image': 'assets/images/charity_illustration.png',
        },
      ],
      'contributions': [
        {
          'title': 'تبرع بأدوية مناعة',
          'description': 'توفير كمية من الأدوية للحالات غير القادرة',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'دعم أجهزة طبية',
          'description': 'توفير أجهزة متابعة صحية لبعض المرضى',
          'image': 'assets/images/blood_illustration.png',
        },
      ],
      'medicines': [
        {
          'title': 'حالة بحاجة لعلاج شهري',
          'description': 'مريضة بحاجة إلى استكمال العلاج المناعي الشهري بشكل عاجل',
          'image': 'assets/images/medicine_illustration.png',
        },
        {
          'title': 'دعوة للتبرع بالدم',
          'description': 'الجمعية تطلب متبرعين لدعم إحدى الحالات الحرجة',
          'image': 'assets/images/blood_illustration.png',
        },
      ],
    },
  ];

  static const Map<String, dynamic> religion = {
    "listenAndRest": {
      'mostListened': [
        {
          "title": 'الصبر عند المرض',
          "desc": 'كلمات إيمانية تواسي القلب',
          "audio": 'audio/religion/patience_at_illness.mp3',
        },
        {
          "title": 'رحمة الله الواسعة',
          "desc": 'رسالة طمأنينة وأمل للمريض',
          "audio": 'audio/religion/allah_mercy.mp3',
        },
        {
          "title": 'الابتلاء طريق الجنة',
          "desc": 'معاني الصبر والرضا بقضاء الله',
          "audio": 'audio/religion/trial_to_paradise.mp3',
        },
        {
          "title": 'لا تيأس من رحمة الله',
          "desc": 'تذكير بالأمل والسكينة',
          "audio": 'audio/religion/do_not_despair.mp3',
        },
      ],
      'quranicRecitations': [
        {
          "title": 'سورة الشرح',
          "desc": '﴿فَإِنَّ مَعَ الْعُسْرِ يُسْرًا﴾',
          "audio": 'audio/quran/surah_al_sharh.mp3',
        },
        {
          "title": 'سورة الضحى',
          "desc": 'سورة تبعث الطمأنينة والأمل',
          "audio": 'audio/quran/surah_al_duha.mp3',
        },
        {
          "title": 'سورة يوسف',
          "desc": 'سورة الصبر والفرج بعد الشدة',
          "audio": 'audio/quran/surah_yusuf.mp3',
        },
        {
          "title": 'سورة الرحمن',
          "desc": 'تلاوة هادئة ومريحة للنفس',
          "audio": 'audio/quran/surah_al_rahman.mp3',
        },
        {
          "title": 'سورة الملك',
          "desc": 'من السور المباركة العظيمة',
          "audio": 'audio/quran/surah_al_mulk.mp3',
        },
        {
          "title": 'آية الكرسي',
          "desc": 'من أعظم آيات القرآن الكريم',
          "audio": 'audio/quran/ayat_al_kursi.mp3',
        },
      ],
      'recordedSupplications': [
        {
          "title": 'أذكار الصباح',
          "desc": 'أذكار لبداية يوم مطمئن',
          "audio": 'audio/azkar/morning_azkar.mp3',
        },
        {
          "title": 'أذكار المساء',
          "desc": 'أذكار السكينة قبل النوم',
          "audio": 'audio/azkar/evening_azkar.mp3',
        },
        {
          "title": 'أسماء الله الحسنى',
          "desc": 'تدبر في أسماء الله وصفاته',
          "audio": 'audio/azkar/allah_names.mp3',
        },
        {
          "title": 'أذكار النوم',
          "desc": 'أذكار تساعد على الراحة والطمأنينة',
          "audio": 'audio/azkar/sleep_azkar.mp3',
        },
        {
          "title": 'من دعاء الرسول ﷺ',
          "desc": 'أدعية نبوية جامعة',
          "audio": 'audio/azkar/prophet_dua.mp3',
        },
        {
          "title": 'الرقية بالقرآن',
          "desc": 'آيات الرقية الشرعية',
          "audio": 'audio/azkar/ruqyah.mp3',
        },
        {
          "title": 'دعاء الهم والحزن',
          "desc": 'دعاء لتفريج الكرب والضيق',
          "audio": 'audio/azkar/sadness_dua.mp3',
        },
        {
          "title": 'دعاء الكرب',
          "desc": 'دعاء عند الشدة والضيق',
          "audio": 'audio/azkar/distress_dua.mp3',
        },
        {
          "title": 'دعاء الشفاء',
          "desc": 'أدعية للشفاء والعافية',
          "audio": 'audio/azkar/healing_dua.mp3',
        },
        {
          "title": 'دعاء الرضا بالقضاء',
          "desc": 'طمأنينة وتسليم لأمر الله',
          "audio": 'audio/azkar/contentment_dua.mp3',
        },
        {
          "title": 'دعاء تفريج الهم',
          "desc": 'دعاء يبعث الراحة في القلب',
          "audio": 'audio/azkar/relief_dua.mp3',
        },
      ],
    },
    "watchAndReflect": {
      'faithBasedVideos': [
        {
          "title": 'الصبر عند المرض',
          "desc": 'كلمات إيمانية تواسي القلب',
          "audio": 'audio/religion/patience_at_illness.mp3',
        },
        {
          "title": 'رحمة الله لا تنقطع',
          "desc": 'رسائل أمل لكل مبتلى',
          "audio": 'audio/religion/allah_mercy.mp3',
        },
        {
          "title": 'كيف تواجه الابتلاء؟',
          "desc": 'معاني الصبر والثبات في المحن',
          "audio": 'audio/religion/facing_trials.mp3',
        },
        {
          "title": 'طمأنينة القلب بذكر الله',
          "desc": 'رحلة إيمانية نحو السكينة',
          "audio": 'audio/religion/peace_with_dhikr.mp3',
        },
        {
          "title": 'الأمل بعد التعب',
          "desc": 'رسالة لكل من أثقله المرض',
          "audio": 'audio/religion/hope_after_pain.mp3',
        },
      ],
      'inspirations': [
        {
          "title": 'قصة أيوب عليه السلام',
          "desc": 'أعظم دروس الصبر والرضا',
          "audio": 'audio/inspiration/prophet_ayoub.mp3',
        },
        {
          "title": 'لا تحزن',
          "desc": 'كلمات تمنح القلب راحة وسكينة',
          "audio": 'audio/inspiration/do_not_be_sad.mp3',
        },
        {
          "title": 'مع العسر يسرا',
          "desc": 'رسائل قرآنية تبعث الأمل',
          "audio": 'audio/inspiration/with_hardship_comes_ease.mp3',
        },
        {
          "title": 'ثق بالله',
          "desc": 'كيف يمنحنا التوكل قوة داخلية',
          "audio": 'audio/inspiration/trust_in_allah.mp3',
        },
        {
          "title": 'رحلة التعافي النفسي',
          "desc": 'خواطر تساعد على الاطمئنان',
          "audio": 'audio/inspiration/healing_journey.mp3',
        },
      ],
    },
    'remembranceAndComfort': [
      {
        "title": 'أذكار الطمأنينة',
        "desc": 'أذكار تبعث السكينة في القلب',
        "audio": 'audio/comfort/peace_azkar.mp3',
      },
      {
        "title": 'دعاء الشفاء',
        "desc": 'أدعية للراحة والعافية',
        "audio": 'audio/comfort/healing_dua.mp3',
      },
      {
        "title": 'آيات السكينة',
        "desc": 'تلاوات مريحة للنفس',
        "audio": 'audio/comfort/tranquility_verses.mp3',
      },
      {
        "title": 'الرقية الشرعية',
        "desc": 'آيات وأدعية للحفظ والطمأنينة',
        "audio": 'audio/comfort/ruqyah.mp3',
      },
      {
        "title": 'دعاء تفريج الهم',
        "desc": 'دعاء يخفف الحزن والكرب',
        "audio": 'audio/comfort/relief_dua.mp3',
      },
      {
        "title": 'ذكر الله حياة القلوب',
        "desc": 'خواطر عن أثر الذكر في النفس',
        "audio": 'audio/comfort/dhikr_hearts.mp3',
      },
    ],
  };
  static final List<String> activitiesTabs = ['الدعم المادي', 'مساهمات', 'أدوية'];
}

class Country {
  final String name;
  final String code;
  Country({required this.name, required this.code});
}
