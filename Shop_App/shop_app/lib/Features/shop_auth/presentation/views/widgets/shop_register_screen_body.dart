import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/register_cubit/register_state.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/shop_layout.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/cache_helper.dart';
import 'package:shop_app/core/utils/functions/navigate_to.dart';
import 'package:shop_app/core/utils/functions/show_toast.dart';

class ShopRegisterScreenBody extends StatefulWidget {
  const ShopRegisterScreenBody({super.key});

  @override
  State<ShopRegisterScreenBody> createState() => _ShopRegisterScreenBodyState();
}

class _ShopRegisterScreenBodyState extends State<ShopRegisterScreenBody> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
      var cubit = BlocProvider.of<ShopCubit>(context);
      if (state is ShopRegisterSuccessState) {
        if (state.registerModel.status) {
          // print(state.registerModel.message);
          // print(state.registerModel.data?.token);
          CacheHelper.saveData(
                  key: 'token', value: state.registerModel.data?.token)
              .then((value) {
            token = state.registerModel.data?.token;
            cubit.getHomeData();
            cubit.getShopCategoriesData();
            cubit.getFavoritesData();
            cubit.getUserData();
            if (context.mounted) {
              navigateTo(context, const ShopLayout());
            }
          });
          showToast(
            msg: state.registerModel.message!,
            backgroundColor: Colors.green,
          );
        } else {
          // print(state.registerModel.message);
          showToast(
            msg: state.registerModel.message!,
            backgroundColor: Colors.red,
          );
        }
      }
      if (state is ShopRegisterFailureState) {
        showToast(msg: state.errMessage, backgroundColor: Colors.red);
      }
    }, builder: (context, state) {
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
                    'REGISTER',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Register now to browse our hot offers',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      hintText: 'User Name',
                      prefixIcon: const Icon(Icons.person)),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone)),
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
                        BlocProvider.of<ShopRegisterCubit>(context).isPassword,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<ShopRegisterCubit>(context)
                              .changePasswordVisibility();
                        },
                        icon: Icon(BlocProvider.of<ShopRegisterCubit>(context)
                            .suffixIcon)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is ShopRegisterLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          text: 'REGISTER',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ShopRegisterCubit>(context)
                                  .userRegister(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
