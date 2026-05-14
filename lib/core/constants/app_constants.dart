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
  static const List<Map<String, String>> charities = [
  {
    'name': 'جمعية دعم أمراض المناعة الذاتية',
    'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
    'location': 'القاهرة - مدينة نصر',
  },
  {
    'name': 'جمعية الذئبة الحمراء للدعم',
    'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
    'location': 'القاهرة - مدينة نصر',
  },
  {
    'name': 'مؤسسة أمل لمرضى المناعة',
    'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
    'location': 'الإسكندرية - سموحة',
  },
  {
    'name': 'جمعية الرعاية الصحية المتكاملة',
    'description': 'توفر جلسات توعية، دعم نفسي، مجموعات مشاركة، ومساعدات للمرضى.',
    'location': 'الجيزة - المهندسين',
  },
];
static const List<Map<String, String>> charityCases = [
  {
    'title': 'مطلوب دعم مادي عاجل',
    'amount': '3000ج',
    'remaining': '500ج',
    'progress': '0.7',
    'image': 'assets/images/charity_illustration.png',
  },
  {
    'title': 'مطلوب دعم مادي عاجل',
    'amount': '6000ج',
    'remaining': '3000ج',
    'progress': '0.5',
    'image': 'assets/images/charity_illustration.png',
  },
  {
    'title': 'مطلوب أدوية عاجلة',
    'amount': '1500ج',
    'remaining': '200ج',
    'progress': '0.85',
    'image': 'assets/images/charity_illustration.png',
  },
];
static const List<Map<String, String>> medicinesCases = [
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
];
static const List<Map<String, String>> contributions = [
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
  {
    'title': 'فرصة أجر... تبرع بالدم',
    'description': 'مطلوب متبرعين بالدم بشكل عاجل لدعم حالة مرضية.',
    'image': 'assets/images/blood_illustration.png',
  },
];
}

class Country {
  final String name;
  final String code;
  Country({required this.name, required this.code});
}
