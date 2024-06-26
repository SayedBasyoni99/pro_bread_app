import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../models/send_gift_model.dart';
import '../../domain/usecases/send_gift_usecase.dart';

abstract class CommonRemoteDataSource {
  Future<SendGiftModel> sendGift({
    required SendGiftParams params,
  });
}

class CommonRemoteDataSourceImpl implements CommonRemoteDataSource {
  @override
  Future<SendGiftModel> sendGift({
    required SendGiftParams params,
  }) async {
    try {
      const String sendGiftEndpoint = '/api/v1/gift/info';
      final dynamic response = await dioConsumer.post(
        sendGiftEndpoint,
        body: params.toJson(),
      );

      if (response['status'] == 200) {
        return SendGiftModel.fromJson(response);
      }
      throw ServerException(message: response['error'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
