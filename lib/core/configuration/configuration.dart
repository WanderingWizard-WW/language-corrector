const _baseUrl = 'baseUrl';

enum Environment { prod }

Map<String, dynamic> _config = _prodConstants;

Environment _currentEnvironment = Environment.prod;

Environment get currentEnvironment => _currentEnvironment;

String get baseUrl => _config[_baseUrl];

void setEnvironment(Environment env) {
  _currentEnvironment = env;
  switch (env) {
    case Environment.prod:
      _config = _prodConstants;
      break;
  }
}

Map<String, dynamic> _prodConstants = {
  _baseUrl: '',
};
