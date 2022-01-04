import std.stdio;
import vibe.vibe;
import global;
import db;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.render!("index.dt", req);
}

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	Global
		.getRouter()
		.addRoute("get", "/test", &index)
		.addRoute("get", "/", &index);

	auto focus = Focus(FocusType.GAME, "Overwatch", "overwatch_image_url", "hate myself.");
	auto profile = Profile("Carter", "image_url", "Test", focus);

	Global.getDb().insert(profile);

	auto listener = listenHTTP(new HTTPServerSettings, Global.getRouter().getVibeRouter());
	scope (exit)
	{
		listener.stopListening();
	}

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
