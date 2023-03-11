abstract class ApiEndpointPath {
  const ApiEndpointPath._();

  static const login = '/api/acnt/login';
  static const getProp = '/api/cam/getprop';
  static const setProp = '/api/cam/setprop';
  static const triggerRecord = '/api/cam/rec';
  static const toggleAfLock = '/api/cam/drivelens';
  static const getUpdate = '/api/cam/getcurprop';
  static const getInfo = '/api/sys/getdevinfo';
  static const liveViewControl = '/api/cam/lv';
  static const liveViewGetImage = '/api/cam/lvgetimg';
}
