import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/charity_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/doctor_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_member_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/pharmacy_signup_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/activities_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/financial_support_details_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/community_details_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/communities_support_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/contribution_details_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/medicine_details_view.dart';
import 'package:lupus_app/features/home/presentation/views/bottom_nav_bar_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/discussions_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/friend_chat_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/friends_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/create_content_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/posts_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/psychological_support_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';
import 'package:lupus_app/features/religion/presentation/views/listen_and_rest_assured_view.dart';
import 'package:lupus_app/features/religion/presentation/views/religion_view.dart';
import 'package:lupus_app/features/religion/presentation/views/watch_and_reflect_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    // if (settings.name == Routes.bottomNavBar) return MaterialPageRoute(builder: (_) => const BottomNavBarView());

    switch (settings.name) {
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());

      case Routes.patientRegister:
        return MaterialPageRoute(builder: (_) => const PatientSignupView());

      case Routes.doctorRegister:
        return MaterialPageRoute(builder: (_) => const DoctorSignupView());

      case Routes.charityRegister:
        return MaterialPageRoute(builder: (_) => const CharitySignupView());

      case Routes.patientMemberRegister:
        return MaterialPageRoute(builder: (_) => const PatientMemberSignupView());

      case Routes.pharmacyRegister:
        return MaterialPageRoute(builder: (_) => const PharmacySignupView());

      case Routes.psychologicalSupport:
        return MaterialPageRoute(builder: (_) => const PsychologicalSupportView());

      case Routes.posts:
        return MaterialPageRoute(builder: (_) => const PostsView());
      case Routes.createContent:
        final config = settings.arguments as NewPostConfig;
        return MaterialPageRoute(builder: (_) => CreateContentView(config: config));
      case Routes.discussions:
        return MaterialPageRoute(builder: (_) => const DiscussionsView());
      case Routes.friends:
        return MaterialPageRoute(builder: (_) => const FriendsView());
      case Routes.friendChat:
        return MaterialPageRoute(builder: (_) => const FriendChatView());

      case Routes.religion:
        return MaterialPageRoute(builder: (_) => const ReligionView());
      case Routes.communitySupport:
        return MaterialPageRoute(builder: (_) => const CommunitiesSupportView());

      case Routes.communityDetails:
        final community = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => CommunityDetailsView(community));

      case Routes.activities:
        final community = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ActivitiesView(community));

      case Routes.financialSupportDetails:
        final financialSupport = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => FinancialSupportDetailsView(financialSupport));

      case Routes.contributeDetails:
        final contribute = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ContributeDetailsView(contribute));

      case Routes.medicineDetails:
        final medicine = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => MedicineDetailsView(medicine));

      case Routes.listenAndRelax:
        final listenAndRest = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ListenAndRelaxView(listenAndRest));

 case Routes.watchAndReflect:
        final watchAndReflect = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => WatchAndReflectView(watchAndReflect));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
