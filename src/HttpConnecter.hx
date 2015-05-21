package;

import openfl.net.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class HttpConnector
{
	public static var contentType:String = "application/x-www-form-urlencoded";
	public static var method:String = URLRequestMethod.POST;
	public static function sendData(data:Dynamic, url:String = "http://localhost/KJRW/index.php") {
		var req:URLRequest = new URLRequest(url);
		req.method = method;
		req.contentType = contentType;
		req.data = "data=" + data;
		var loader:URLLoader = new URLLoader();
		loader.load(req);
	}
}