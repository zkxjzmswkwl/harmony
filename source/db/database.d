module db.database;

import std.uuid;
import std.conv;

import microrm;

auto cts() @property
{
    import std.datetime;
    return Clock.currStdTime;
}

enum RequestType
{
    GET,
    POST,
    PUT,
    DELETE
}

enum ServerType
{
    PROJECT,
    COMMUNITY,
    TEST,
    OFFIICAL,
    GAME
}

enum ImageType
{
    INLINE,
    SERVER,
    USER
}

struct Image
{
    int         id;
    ImageType   type;
    Date        timestamp;
}

struct Server
{
    int         id;
    int         deleteFlag;
    string      name;
    ServerType  type;
}

struct User
{
    int     id;
    int     deleteFlag;
    string  name;
    string  email;
    string  password;
    Date    timeCreated;
    Date    lastAccess;
}

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
        // data.id = md5UUID(data.timeCreated).toString();
        db.insert(data);
        return this;
    }

    auto read(int id)
    {
        return db.select!Profile.where("id =", id).run;
    }

}
