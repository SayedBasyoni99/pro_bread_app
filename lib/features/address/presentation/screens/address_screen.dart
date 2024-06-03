import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../controller/get_address/get_address_cubit.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAddressCubit>().fGetAddress(address: 'address', street: 'street', city: 'city', note: 'note');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAddressCubit, GetAddressState>(
      listener: (context, state) {
        if (state is GetAddressErrorState) {
          showAppSnackBar(
            context: context,
            message: state.message,
            type: ToastType.error,
          );
        }
        if (state is GetAddressSuccessState) {
          showAppSnackBar(
            context: context,
            message: state.message,
            type: ToastType.success,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Address'),
        ),
        body: BlocBuilder<GetAddressCubit, GetAddressState>(
          builder: (context, state) {
            if (state is GetAddressLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppConst.kBorderButtonColor,
                ),
              );
            }
            if (state is GetAddressSuccessState) {
              return Text(
                state.value?.city ?? '',
              );
            }
            return Text(
              context.read<GetAddressCubit>().data?.note ?? '',
            );
            // return const SizedBox();
          },
        ),
      ),
    );
  }
}
