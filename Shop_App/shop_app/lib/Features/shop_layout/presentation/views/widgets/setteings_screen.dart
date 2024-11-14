import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';
import 'package:shop_app/core/utils/functions/show_toast.dart';
import 'package:shop_app/core/utils/functions/signout.dart';

class SetteingsScreen extends StatefulWidget {
  const SetteingsScreen({super.key});

  @override
  State<SetteingsScreen> createState() => _SetteingsScreenState();
}

class _SetteingsScreenState extends State<SetteingsScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ShopCubit>(context);
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopFailureUserDataState) {
        showToast(
            msg: 'There was an error , try later', backgroundColor: Colors.red);
      }
      if (state is ShopFailureUpdateUserState) {
        showToast(
            msg: 'There was an error , try later', backgroundColor: Colors.red);
      }
    }, builder: (context, state) {
      if (cubit.userModel != null) {
        nameController.text = cubit.userModel!.data!.name;
        emailController.text = cubit.userModel!.data!.email;
        phoneController.text = cubit.userModel!.data!.phone;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email Address',
                    prefixIcon: const Icon(Icons.email)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone',
                    prefixIcon: const Icon(Icons.phone)),
                const SizedBox(
                  height: 40,
                ),
                state is ShopLoadingUpdateUserState
                    ? const LinearProgressIndicator()
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'UPDATE',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<ShopCubit>(context).updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text);
                      // BlocProvider.of<ShopCubit>(context).getUserData();
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: 'LogOut',
                  onTap: () {
                    signOut(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
