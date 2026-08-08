class DoctorSignupModel {
  // Step 1
  String? name;
  String? phone;
  String? email;
  String? password;
  String? country;
  String? city;

  // Step 2
  String? specialization;
  String? academicDegree;
  String? experienceYears;
  String? availability;
  String? consultationType;
  String? workPlace;
  String? workingHours;
  String? fees;
  String? bio;

  DoctorSignupModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.country,
    this.city,
    this.specialization,
    this.academicDegree,
    this.experienceYears,
    this.availability,
    this.consultationType,
    this.workPlace,
    this.workingHours,
    this.fees,
    this.bio,
  });

  DoctorSignupModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? country,
    String? city,
    String? specialization,
    String? academicDegree,
    String? experienceYears,
    String? availability,
    String? consultationType,
    String? workPlace,
    String? workingHours,
    String? fees,
    String? bio,
  }) {
    return DoctorSignupModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      country: country ?? this.country,
      city: city ?? this.city,
      specialization: specialization ?? this.specialization,
      academicDegree: academicDegree ?? this.academicDegree,
      experienceYears: experienceYears ?? this.experienceYears,
      availability: availability ?? this.availability,
      consultationType: consultationType ?? this.consultationType,
      workPlace: workPlace ?? this.workPlace,
      workingHours: workingHours ?? this.workingHours,
      fees: fees ?? this.fees,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'country': country,
      'city': city,
      'specialization': specialization,
      'academic_degree': academicDegree,
      'experience_years': experienceYears,
      'availability': availability,
      'consultation_type': consultationType,
      'work_place': workPlace,
      'working_hours': workingHours,
      'fees': fees,
      'bio': bio,
    };
  }

  factory DoctorSignupModel.fromJson(Map<String, dynamic> json) {
    return DoctorSignupModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      country: json['country'],
      city: json['city'],
      specialization: json['specialization'],
      academicDegree: json['academic_degree'],
      experienceYears: json['experience_years'],
      availability: json['availability'],
      consultationType: json['consultation_type'],
      workPlace: json['work_place'],
      workingHours: json['working_hours'],
      fees: json['fees'],
      bio: json['bio'],
    );
  }

  get passwordController => null;
}
