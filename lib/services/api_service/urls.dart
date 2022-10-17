import '../../constants/server_const.dart';

var mainPath = (int element) => servers.elementAt(element).values.elementAt(2);
var server = (int el) => mainPath(el) + 'api/api.php?';
var serverIot = (int el) => mainPath(el) + 'api/IOTapi.php?';

String formatAPI(
    {required String dataUrl, String? type, required int serverType}) {
  dataUrl = 'URI=' + dataUrl.replaceAll(r'\', '');
  dataUrl = dataUrl.replaceAll('"', '%22');
  dataUrl = dataUrl.split('{').join('%7B');
  dataUrl = dataUrl.split('}').join('%7D');
  if (type == 'iot') {
    return serverIot(serverType) + dataUrl;
  } else {
    return server(serverType) + dataUrl;
  }
}
