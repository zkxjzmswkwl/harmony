module global;

import vibe.vibe;
import router;

static class Global
{
    public static Router hRouter;

    public static Router * getRouter()
    {
        if (this.hRouter !is null)
        {
            return &hRouter;
        }
        else
        {
            this.hRouter = new Router();
            return &hRouter;
        }
    }
}