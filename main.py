import asyncio

import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Capybara")

class ApiHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Capybara API")

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/api", ApiHandler),
    ])

async def main():
    print("Starting server...")
    app = make_app()
    app.listen(8888)
    await asyncio.Event().wait()

if __name__ == "__main__":
    asyncio.run(main())
