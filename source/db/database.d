module db.database;

import microrm;

enum RequestType
{
    GET,
    POST,
    PUT,
    DELETE
}

enum FocusType
{
    GAME,
    STUDY,
    CODE
}

struct Request
{
    string url;
    string timestamp;
    string ip;
    string headers;
    bool deemedMalicious;
    RequestType type;
}

struct Focus
{
    FocusType type;
    string title;
    string icon;
    string explanation;
}

struct Profile
{
    string displayName;
    string picture;
    string status;
    Focus focus;
}

struct Account
{
    Profile profile;
    string email;
    string password;
    string ip;
    string timeCreated;
    string timeAccessed;
    string phoneNumber;
    bool isBanned = false;
}

enum schema = buildSchema!(
    Request, Focus, Profile, Account
);

class Database
{
    MDatabase db;

    this(string dbFile)
    {
        this.db = new MDatabase(dbFile);
        this.db.run(schema);
    }

    auto insert(T)(T data)
    {
        db.insert(data);
        return this;
    }
}

