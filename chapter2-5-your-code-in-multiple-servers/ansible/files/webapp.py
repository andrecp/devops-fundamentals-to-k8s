#!/usr/bin/env python3
import json
from http.server import HTTPServer, BaseHTTPRequestHandler

num_requests = 0

class Handler(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()

    def do_GET(self):
        self._set_headers()
        global num_requests
        num_requests += 1
        content = json.dumps({"num_requests": num_requests}).encode("utf8")
        self.wfile.write(content)


if __name__ == "__main__":
    http_service = HTTPServer(("0.0.0.0", 8000), Handler)
    print(f"Starting http service on 0.0.0.0:8000")
    http_service.serve_forever()
