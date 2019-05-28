import { serve } from "https://deno.land/std/http/server.ts";
const PORT = Deno.env().PORT || 3000
const s = serve(`0.0.0.0:${PORT}`);

async function main() {
  for await (const req of s) {
    req.respond({ body: new TextEncoder().encode("Hello World\n") });
  }
}

main();
