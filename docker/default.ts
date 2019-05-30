import { serve } from "https://deno.land/std/http/server.ts";
const PORT = Deno.env().PORT || 80
const s = serve(`0.0.0.0:${PORT}`);

async function main() {
  for await (const req of s) {
    req.respond({ body: new TextEncoder().encode(`<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8">
  <head>
    <style>
    html, body {
      margin: 0;
      width: 100%;
      height: 100%;
    }
    div {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    span {
      font-size: 80px;
      font-weight: 600;
      margin: 20px;
    }
    </style>
  </head>
  <body>
    <div>
      <span>Welcome to</span>
      <a href="https://deno.land">
        <img src="https://deno.land/images/deno_logo_2.gif">
      </a>
      <span>on</span>
      <a href="https://azure.microsoft.com/ja-jp/services/app-service/containers/">
        <svg id="svg-app-service-containers" viewBox="0 0 15 11.151" style="height: 200px; width: 200px;">
          <polygon points="6.457 0 0 2.147 0 7.476 5.982 9.686 6.451 9.861 6.451 9.859 12.987 7.487 12.987 2.148 6.457 0" fill="#804998"></polygon>
          <polygon points="12.986 7.494 6.458 9.861 6.458 0.009 12.987 2.159 12.986 7.494" fill="#fff" opacity="0.2" style="isolation:isolate"></polygon><polygon points="0.643 7.284 0.692 7.306 0.689 2.651 0.956 2.536 0.956 2.324 0.534 2.497 0.535 7.236 0.643 7.284" opacity="0.5"></polygon>
          <polygon points="3.164 1.826 3.164 1.589 2.352 1.938 2.352 7.876 2.552 7.986 2.552 2.084 3.164 1.826" opacity="0.5"></polygon>
          <polygon points="3.806 1.576 4.087 1.492 4.393 1.4 4.493 1.37 4.493 1.163 4.187 1.255 3.881 1.346 3.6 1.431 3.6 8.323 3.806 8.385 3.806 1.576" opacity="0.5"></polygon>
          <polygon points="5.083 1.196 5.99 0.868 5.99 0.641 4.875 1.05 4.875 8.845 5.083 8.944 5.083 1.196" opacity="0.5"></polygon><polygon points="1.779 2.316 1.988 2.247 1.991 2.245 1.991 2.031 1.782 2.101 1.573 2.171 1.364 2.241 1.364 7.48 1.57 7.549 1.57 2.386 1.779 2.316" opacity="0.5"></polygon>
          <path d="M14.85,9.789a1.177,1.177,0,0,0-1.18-1.18h-.159a3.466,3.466,0,0,0,.128-.829,3.137,3.137,0,0,0-6.121-.988,2.487,2.487,0,0,0-.7-.128,2.168,2.168,0,0,0,0,4.336h6.95A1.212,1.212,0,0,0,14.85,9.789" fill="#59b4d9"></path>
          <path d="M6.817,11.151a2.318,2.318,0,0,1,0-4.636,2.267,2.267,0,0,1,.606.095,3.262,3.262,0,0,1,3.06-2.136,3.31,3.31,0,0,1,3.307,3.307,3.163,3.163,0,0,1-.088.68A1.331,1.331,0,0,1,15,9.789a1.362,1.362,0,0,1-1.219,1.36Zm0-4.335a2.017,2.017,0,0,0,0,4.034h6.949A1.059,1.059,0,0,0,14.7,9.789,1.031,1.031,0,0,0,13.67,8.76h-.352l.047-.187a3.359,3.359,0,0,0,.123-.793,3.01,3.01,0,0,0-3.006-3.006A2.967,2.967,0,0,0,7.66,6.838l-.045.138-.139-.039A2.341,2.341,0,0,0,6.817,6.816Z" fill="#fff"></path>
          <path d="M7.917,11A2.167,2.167,0,0,1,8.969,7.366a1.761,1.761,0,0,1,.7-.032,3.162,3.162,0,0,1,1.753-2.55,3.005,3.005,0,0,0-.956-.159A3.12,3.12,0,0,0,7.5,6.793a2.487,2.487,0,0,0-.7-.128A2.168,2.168,0,0,0,6.8,11H7.917Z" fill="#fff" opacity="0.2" style="isolation:isolate"></path><circle cx="6.917" cy="0.651" r="0.173" opacity="0.4"></circle>
          <circle cx="12.506" cy="2.447" r="0.173" opacity="0.4"></circle>
        </svg>
      </a>
    </div>
  </body>
</html>`) });
  }
}

main();
