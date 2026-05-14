class PatientSignupModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? birthDate;
  final String? gender;
  final String? country;
  final String? city;
  final String? medications;
  final String? dose;
  final String? frequency;
  final String? diagnosisDate;
  final String? lupusType;
  final String? symptoms;
  final String? otherDiseases;
  final String? drugAllergies;
  final String? specialNeeds;
  final String? reports;

  const PatientSignupModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.birthDate,
    this.gender,
    this.country,
    this.city,
    this.medications,
    this.dose,
    this.frequency,
    this.diagnosisDate,
    this.lupusType,
    this.symptoms,
    this.otherDiseases,
    this.drugAllergies,
    this.specialNeeds,
    this.reports,
  });

  // ── empty ──────────────────────────────────────────────────────────────────
  factory PatientSignupModel.empty() => const PatientSignupModel();

  // ── fromJson ───────────────────────────────────────────────────────────────
  factory PatientSignupModel.fromJson(Map<String, dynamic> json) {
    return PatientSignupModel(
      name:          json['name']          as String?,
      phone:         json['phone']         as String?,
      email:         json['email']         as String?,
      password:      json['password']      as String?,
      birthDate:     json['birthDate']     as String?,
      gender:        json['gender']        as String?,
      country:       json['country']       as String?,
      city:          json['city']          as String?,
      medications:   json['medications']   as String?,
      dose:          json['dose']          as String?,
      frequency:     json['frequency']     as String?,
      diagnosisDate: json['diagnosisDate'] as String?,
      lupusType:     json['lupusType']     as String?,
      symptoms:      json['symptoms']      as String?,
      otherDiseases: json['otherDiseases'] as String?,
      drugAllergies: json['drugAllergies'] as String?,
      specialNeeds:  json['specialNeeds']  as String?,
      reports:       json['reports']       as String?,
    );
  }

  // ── toJson ─────────────────────────────────────────────────────────────────
  Map<String, dynamic> toJson() => {
        'name':          name,
        'phone':         phone,
        'email':         email,
        'password':      password,
        'birthDate':     birthDate,
        'gender':        gender,
        'country':       country,
        'city':          city,
        'medications':   medications,
        'dose':          dose,
        'frequency':     frequency,
        'diagnosisDate': diagnosisDate,
        'lupusType':     lupusType,
        'symptoms':      symptoms,
        'otherDiseases': otherDiseases,
        'drugAllergies': drugAllergies,
        'specialNeeds':  specialNeeds,
        'reports':       reports,
      };

  // ── copyWith ───────────────────────────────────────────────────────────────
  PatientSignupModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? birthDate,
    String? gender,
    String? country,
    String? city,
    String? medications,
    String? dose,
    String? frequency,
    String? diagnosisDate,
    String? lupusType,
    String? symptoms,
    String? otherDiseases,
    String? drugAllergies,
    String? specialNeeds,
    String? reports,
  }) {
    return PatientSignupModel(
      name:          name          ?? this.name,
      phone:         phone         ?? this.phone,
      email:         email         ?? this.email,
      password:      password      ?? this.password,
      birthDate:     birthDate     ?? this.birthDate,
      gender:        gender        ?? this.gender,
      country:       country       ?? this.country,
      city:          city          ?? this.city,
      medications:   medications   ?? this.medications,
      dose:          dose          ?? this.dose,
      frequency:     frequency     ?? this.frequency,
      diagnosisDate: diagnosisDate ?? this.diagnosisDate,
      lupusType:     lupusType     ?? this.lupusType,
      symptoms:      symptoms      ?? this.symptoms,
      otherDiseases: otherDiseases ?? this.otherDiseases,
      drugAllergies: drugAllergies ?? this.drugAllergies,
      specialNeeds:  specialNeeds  ?? this.specialNeeds,
      reports:       reports       ?? this.reports,
    );
  }

  // ── toString ───────────────────────────────────────────────────────────────
  @override
  String toString() => 'PatientSignupModel(${toJson()})';
}