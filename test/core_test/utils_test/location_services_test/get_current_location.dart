import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/location_services/get_current_location.dart';

import 'get_current_location.mocks.dart';

@GenerateMocks([Location])
void main() {
  late MockLocation location;
  late LocationServicesImpl locationServicesImpl;

  setUp(() {
    location = MockLocation();
    locationServicesImpl = LocationServicesImpl(location);
  });

  final testLocationData = LocationData.fromMap({});

  group('enableLocationServices', () {
    test(
        'should not throw failure when call the function and services be enabled',
        () async {
      when(location.requestService())
          .thenAnswer((realInvocation) async => true);
      await locationServicesImpl.enableLocationServices();
      verify(location.requestService());
    });
    test(
        'should throw ServicesRequestFailure when call the function and services not enabled',
        () async {
      when(location.requestService())
          .thenAnswer((realInvocation) async => false);
      final result = locationServicesImpl.enableLocationServices;
      expect(result, throwsA(const TypeMatcher<RequestServicesFailure>()));
      verify(location.requestService());
    });
  });

  group('getLocationPermission', () {
    test(
        'should not throw When call the Function and permission granted or limit granted',
        () async {
      when(location.requestPermission())
          .thenAnswer((realInvocation) async => PermissionStatus.granted);
      await locationServicesImpl.getLocationPermission();
      verify(location.requestPermission());
    });

    test(
        'should throw GetPermissionFailure When call the Function and permission denied or fully denied',
        () async {
      when(location.requestPermission())
          .thenAnswer((realInvocation) async => PermissionStatus.denied);
      final result = locationServicesImpl.getLocationPermission;
      expect(result, throwsA(const TypeMatcher<GetPermissionFailure>()));
      verify(location.requestPermission());
    });
  });

  group('getCurrentLocation', () {
    group('no errors with enable services or request permissions', () {
      setUp(() {
        when(location.getLocation())
            .thenAnswer((realInvocation) async => testLocationData);
        when(location.requestService())
            .thenAnswer((realInvocation) async => true);
        when(location.requestPermission())
            .thenAnswer((realInvocation) async => PermissionStatus.granted);
      });
      test(
          'should return locationData when call the function and services is enabled and permission is granted',
          () async {
        when(location.serviceEnabled())
            .thenAnswer((realInvocation) async => true);
        when(location.hasPermission())
            .thenAnswer((realInvocation) async => PermissionStatus.granted);
        final result = await locationServicesImpl.getCurrentLocation();
        verify(location.getLocation());
        expect(result, Right(testLocationData));
      });

      test(
          '''should return locationData and call requestServices and requestPermission
          when call the function and services is not enabled and permission is not granted''',
          () async {
        when(location.serviceEnabled())
            .thenAnswer((realInvocation) async => false);
        when(location.hasPermission())
            .thenAnswer((realInvocation) async => PermissionStatus.denied);
        final result = await locationServicesImpl.getCurrentLocation();
        verify(location.getLocation());
        verify(location.requestService());
        verify(location.requestPermission());
        expect(result, Right(testLocationData));
      });
    });
    test(
        'should return RequestServicesFailure when call the function and could not enable services',
        () async {
      when(location.serviceEnabled())
          .thenAnswer((realInvocation) async => false);
      when(location.requestService())
          .thenAnswer((realInvocation) async => false);
      when(location.hasPermission())
          .thenAnswer((realInvocation) async => PermissionStatus.granted);
      final result = await locationServicesImpl.getCurrentLocation();
      expect(
          result,
          const Left(RequestServicesFailure(
              'location services is not enabled please enable it from settings')));
      verifyNever(location.getLocation());
      verify(location.requestService());
    });
  });
}
