

open class Avatars: Service
{
    /**
     * Get Browser Icon
     *
     * You can use this endpoint to show different browser icons to your users.
     * The code argument receives the browser code as it appears in your user
     * /account/sessions endpoint. Use width, height and quality arguments to
     * change the output settings.
     *
     * @param String _code
     * @param Int _width
     * @param Int _height
     * @param Int _quality
     * @throws Exception
     * @return array
     */

    open func getBrowser(_code: String, _width: Int = 100, _height: Int = 100, _quality: Int = 100) -> Array<Any> {
        var path: String = "/avatars/browsers/{code}"

        path = path.replacingOccurrences(
          of: "{code}",
          with: _code
        )

                var params: [String: Any] = [:]
        
        params["width"] = _width
        params["height"] = _height
        params["quality"] = _quality

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

    /**
     * Get Credit Card Icon
     *
     * Need to display your users with your billing method or their payment
     * methods? The credit card endpoint will return you the icon of the credit
     * card provider you need. Use width, height and quality arguments to change
     * the output settings.
     *
     * @param String _code
     * @param Int _width
     * @param Int _height
     * @param Int _quality
     * @throws Exception
     * @return array
     */

    open func getCreditCard(_code: String, _width: Int = 100, _height: Int = 100, _quality: Int = 100) -> Array<Any> {
        var path: String = "/avatars/credit-cards/{code}"

        path = path.replacingOccurrences(
          of: "{code}",
          with: _code
        )

                var params: [String: Any] = [:]
        
        params["width"] = _width
        params["height"] = _height
        params["quality"] = _quality

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

    /**
     * Get Favicon
     *
     * Use this endpoint to fetch the favorite icon (AKA favicon) of a  any remote
     * website URL.
     *
     * @param String _url
     * @throws Exception
     * @return array
     */

    open func getFavicon(_url: String) -> Array<Any> {
        let path: String = "/avatars/favicon"


                var params: [String: Any] = [:]
        
        params["url"] = _url

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

    /**
     * Get Country Flag
     *
     * You can use this endpoint to show different country flags icons to your
     * users. The code argument receives the 2 letter country code. Use width,
     * height and quality arguments to change the output settings.
     *
     * @param String _code
     * @param Int _width
     * @param Int _height
     * @param Int _quality
     * @throws Exception
     * @return array
     */

    open func getFlag(_code: String, _width: Int = 100, _height: Int = 100, _quality: Int = 100) -> Array<Any> {
        var path: String = "/avatars/flags/{code}"

        path = path.replacingOccurrences(
          of: "{code}",
          with: _code
        )

                var params: [String: Any] = [:]
        
        params["width"] = _width
        params["height"] = _height
        params["quality"] = _quality

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

    /**
     * Get Image from URL
     *
     * Use this endpoint to fetch a remote image URL and crop it to any image size
     * you want. This endpoint is very useful if you need to crop and display
     * remote images in your app or in case you want to make sure a 3rd party
     * image is properly served using a TLS protocol.
     *
     * @param String _url
     * @param Int _width
     * @param Int _height
     * @throws Exception
     * @return array
     */

    open func getImage(_url: String, _width: Int = 400, _height: Int = 400) -> Array<Any> {
        let path: String = "/avatars/image"


                var params: [String: Any] = [:]
        
        params["url"] = _url
        params["width"] = _width
        params["height"] = _height

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

    /**
     * Get QR Code
     *
     * Converts a given plain text to a QR code image. You can use the query
     * parameters to change the size and style of the resulting image.
     *
     * @param String _text
     * @param Int _size
     * @param Int _margin
     * @param Int _download
     * @throws Exception
     * @return array
     */

    open func getQR(_text: String, _size: Int = 400, _margin: Int = 1, _download: Int = 0) -> Array<Any> {
        let path: String = "/avatars/qr"


                var params: [String: Any] = [:]
        
        params["text"] = _text
        params["size"] = _size
        params["margin"] = _margin
        params["download"] = _download

        return [self.client.call(method: Client.HTTPMethod.get.rawValue, path: path, headers: [
            "content-type": "application/json",
        ], params: params)];
    }

}
