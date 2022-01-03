module router;

import vibe.vibe;
import std.functional;

class Router
{
    URLRouter router;

    this()
    {
        router = new URLRouter;
    }

    public URLRouter getVibeRouter() { return router; }

    public Router addRoute(
        string type,
        string route,
        void function(HTTPServerRequest req, HTTPServerResponse res) routeLogic
    )
    {
        if (type == "get")
        {
            this.router.get(route, routeLogic);
        } else if (type == "post")
        {
            this.router.post(route, routeLogic);
        }

        return this;
    }
}