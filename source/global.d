module global;

import vibe.vibe;
import router;
import db;

static class Global
{
    public static Router hRouter;
    public static Database db;

    public static Router * getRouter()
    {
        if (hRouter !is null)
        {
            return &hRouter;
        }
        else
        {
            hRouter = new Router();
            return &hRouter;
        }
    }

    public static Database * getDb()
    {
        if (this.db !is null)
        {
            return &db;
        }
        else
        {
            db = new Database("test.db");
            return &db;
        }
    }
}