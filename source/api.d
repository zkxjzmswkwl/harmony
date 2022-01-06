import vibe.d;
import std.stdio;
import std.conv;
import db;
import global;

void getProfile(HTTPServerRequest req, HTTPServerResponse res)
{
	auto balls = Global.getDb().read(1);
	res.render!("index.dt", balls);
}
