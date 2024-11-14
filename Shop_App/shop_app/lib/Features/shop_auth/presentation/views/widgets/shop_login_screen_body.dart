import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/login_cubit/login_state.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/shop_register_screen.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/shop_layout.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/cache_helper.dart';
import 'package:shop_app/core/utils/functions/navigate_to.dart';
import 'package:shop_app/core/utils/functions/show_toast.dart';

class ShopLoginScreenBody extends StatefulWidget {
  const ShopLoginScreenBody({super.key});

  @override
  State<ShopLoginScreenBody> createState() => _ShopLoginScreenBodyState();
}

class _ShopLoginScreenBodyState extends State<ShopLoginScreenBody> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        if (state is ShopLoginSuccessState) {
          if (state.loginModel.status) {
            // print(state.loginModel.message);
            // print(state.loginModel.data?.token);
            CacheHelper.saveData(
                    key: 'token', value: state.loginModel.data?.token)
                .then((value) {
              token = state.loginModel.data?.token;
              cubit.getHomeData();
              cubit.getShopCategoriesData();
              cubit.getFavoritesData();
              cubit.getUserData();
              if (context.mounted) {
                navigateTo(context, const ShopLayout());
              }
            });
            showToast(
              msg: state.loginModel.message!,
              backgroundColor: Colors.green,
            );
          } else {
            // print(state.loginModel.message);
            showToast(
              msg: state.loginModel.message!,
              backgroundColor: Colors.red,
            );
          }
        }
        if (state is ShopLoginFailureState) {
          showToast(msg: state.errMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Login now to browse our hot offers',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email Address',
                        prefixIcon: const Icon(Icons.email_outlined)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      obscureText:
                          BlocProvider.of<ShopLoginCubit>(context).isPassword,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<ShopLoginCubit>(context)
                                .changePasswordVisibility();
                          },
                          icon: Icon(BlocProvider.of<ShopLoginCubit>(context)
                              .suffixIcon)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    state is ShopLoginLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            text: 'LOGIN',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ShopLoginCubit>(context)
                                    .userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                              }
                            },
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ShopRegisterScreen();
                              }));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 16),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
