import std.stdio;
import vibe.vibe;
import global;
import db;
import api;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	string balls = "BALLS";
	res.render!("index.dt", balls);
}

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	Global
        .getRouter()
		.addRoute("get", "/user/:user", &api.getProfile)
		.addRoute("get", "/test", &index)
		.addRoute("get", "/", &index);

	auto identifier = Identifier();
	Global.getDb().insert(identifier);

	// auto focus = Focus(FocusType.GAME, "Overwatch", "icon_url", "good question");
	// auto profile = Profile("Carter", "avi_url", "?XD", focus);

	// Global.getDb().insert(profile);

	auto listener = listenHTTP(settings, Global.getRouter().getVibeRouter());
	scope (exit)
	{
		listener.stopListening();
	}

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
