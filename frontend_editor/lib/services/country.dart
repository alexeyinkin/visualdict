import 'package:country_ip/country_ip.dart';
import 'package:get_ip_address/get_ip_address.dart';

class CountryService {
  String? _ip;
  String _lastCountry = '';

  Future<String> getCountryCode() async {
    if (_lastCountry == 'GE') {
      // ignore: avoid_print
      print('Do not re-verifying a whitelisted country: $_lastCountry');
      return _lastCountry;
    }

    final ip = await IpAddress().getIpAddress();
    if (ip == _ip) {
      return _lastCountry;
    }

    final r = await CountryIp.findFromIP(ip);
    if (r == null) {
      throw Exception('Cannot get the country for $ip');
    }

    _lastCountry = r.countryCode;
    _ip = ip;
    return _lastCountry;
  }

  Future<void> assertAllowed() async {
    final code = await getCountryCode();

    switch (code) {
      case 'RU':
        throw Exception('Country not allowed: $code');
    }
  }
}
