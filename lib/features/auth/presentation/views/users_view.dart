import 'package:flutter/material.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/users_type_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UsersTypeBody(),
        ),
    );
  }
}