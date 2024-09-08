import 'package:caed_app/business_logic/login/login_export.dart';
import 'package:caed_app/presentation/navigation/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/http_client.dart';
import '../../data/repository/caed_repository.dart';
import '../../utils/messages.dart';
import 'custom_input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginCubit get loginCubit => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state is ErrorLoginState) {
            Messages.of(context).showError(state.errorMessage);
          } else if (state is SuccessLoginState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RepositoryProvider<ICaedRepository>(
                  create: (context) => CaedRepository(
                    client: HttpClient(),
                  ),
                  child: const NavigationPage(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state) {
            case LoadingLoginState():
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              return const LoginInitialWidget();
          }
        },
      ),
    );
  }
}

class LoginInitialWidget extends StatefulWidget {
  const LoginInitialWidget({super.key});

  @override
  State<LoginInitialWidget> createState() => _LoginInitialWidgetState();
}

class _LoginInitialWidgetState extends State<LoginInitialWidget> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  LoginCubit get loginCubit => context.read<LoginCubit>();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              child: Image(
                image: AssetImage('assets/login/login_art.png'),
              ),
            ),
            const SizedBox(
              child: Image(
                image: AssetImage('assets/login/logo.png'),
              ),
            ),
            const Spacer(),
            CustomInputWidget(
              label: 'Usuário',
              controller: loginController,
            ),
            CustomInputWidget(
              label: 'Senha',
              controller: passwordController,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                loginCubit.userLogin(
                  username: loginController.text.trim(),
                  password: passwordController.text,
                );
              },
              child: Container(
                color: const Color(0XFFFFFF00),
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Entrar',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
