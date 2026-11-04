from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
import os, socket, webbrowser, threading, time
os.chdir(os.path.dirname(os.path.abspath(__file__)))
class Handler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-cache")
        super().end_headers()
server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
port = server.server_address[1]
url = f"http://127.0.0.1:{port}/index.html"
print(f"Pizza Rush V32: {url}", flush=True)
threading.Timer(1.0, lambda: webbrowser.open(url)).start()
server.serve_forever()
