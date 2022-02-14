import 'dart:math';

double latLongDistance(double lat1, double long1, double lat2, double long2) {
    const pi = 3.1415926535897932;

    var radLat1 = lat1*pi/180;
    var radLong1 = long1*pi/180;
    var radLat2 = lat2*pi/180;
    var radLong2 = long2*pi/180;

    var distance = (acos(cos(radLat2)*cos(radLong2)
                    *cos(radLat1)*cos(radLong1)+cos(radLat2)
                    *sin(radLong2)*cos(radLat1)*sin(radLong1)
                    +sin(radLat2)*sin(radLat1))*6371)*1.15;

    return distance;
}