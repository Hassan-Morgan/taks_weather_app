import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';

import 'network_info_test.mocks.dart';


@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker internetConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    internetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetConnectionChecker);
  });


  test(
      'should call the internetConnectionChecker().hasConnection when call the getCurrentConnectionState',
          () async {
        when(internetConnectionChecker.hasConnection)
            .thenAnswer((realInvocation)async => true);
        final result = await networkInfo.getCurrentConnectionState;
        expect(result, true);
        verify(internetConnectionChecker.hasConnection);
      });
}