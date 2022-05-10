import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import '../../errors/failures.dart';

abstract class LocationServices {
  Future<Either<Failure, LocationData>> getCurrentLocation();
}

class LocationServicesImpl implements LocationServices {
  final Location location;

  LocationServicesImpl(this.location);

  @override
  Future<Either<Failure, LocationData>> getCurrentLocation() async {
    try {
      final bool serviceEnabled = await location.serviceEnabled();
      final PermissionStatus permissionStatus = await location.hasPermission();
      if (!serviceEnabled) {
        await enableLocationServices();
      }
      if (permissionStatus == PermissionStatus.denied ||
          permissionStatus == PermissionStatus.deniedForever) {
        await getLocationPermission();
      }
      final LocationData currentLocationData = await location.getLocation();
      return Right(currentLocationData);
    } on RequestServicesFailure catch (e) {
      return Left(RequestServicesFailure(e.message));
    } on GetPermissionFailure catch (e) {
      return Left(GetPermissionFailure(e.message));
    }
  }

  Future<void> enableLocationServices() async {
    final bool permission = await location.requestService();
    if (permission) {
      return;
    } else {
      throw const RequestServicesFailure(
          'location services is not enabled \n please enable it first and refresh');
    }
  }

  Future<void> getLocationPermission() async {
    final result = await location.requestPermission();
    if (result == PermissionStatus.granted ||
        result == PermissionStatus.grantedLimited) {
      return;
    } else {
      throw const GetPermissionFailure(
          'location permission is not enabled \n please enable it first and refresh');
    }
  }
}
