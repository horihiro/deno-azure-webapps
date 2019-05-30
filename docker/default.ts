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
    </style>
  </head>
  <body>
    <div>
      <a href="https://deno.land">
        <img src="https://deno.land/images/deno_logo_2.gif">
      </a>
    </div>
  </body>
</html>`) });
  }
}

main();
